package com.twitter.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.twitter.bean.Tweet;

import com.twitter.model.UserTweetClassifier;
import com.twitter.model.lsa.StopWords;
import com.twitter.model.Classification;
import com.twitter.model.Porter;

import com.twitter.services.AdminService;
import com.twitter.services.AdminServiceImpl;

/**
 * Servlet implementation class TweetClassificationController
 */
@WebServlet("/TweetClassificationController")
public class TweetClassificationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TweetClassificationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				
		AdminService adminService = new AdminServiceImpl();
		ArrayList<Tweet> twitList = adminService.selectTweet();
		UserTweetClassifier<String, String> bayes = new Classification<String, String>();
		
		String Abusive[]={"abuse","abusive","angry","peeved","grouchy","spiteful","annoyed","resentful","bitter","fight",
				"deceived","furious","bad tempered","tempered","rebellious","shameful","terrible",
				"unreliable","aggressive","frustrated","violated","jealous","hurt","mad","embarrassed",
				"critical","battle","unbeatable","assassination","laid","tranny","barface","hell","pissed","execute","shitty","conspiracy",
				"bitch","idiot","shit","waste","moron","bastard","bad","waste"};
		bayes.learn("Abusive", Arrays.asList(Abusive));
		String Negative[]={"sorry","unworthy","guilty","worthless","desperate","hopeless","helpless",
				"lonely","terrified","discouraged","miserable","gloomy","victimized","unhappy","depressed",
				"guilt","abandoned","despair","bored","remoresful","ashamed","ignored","powerless",
				"vulnerable","inferior","empty","isolated","apathetic","indifferent","sadness","sad",
				"condolences","hurt","death","Unhappy","Aggressive","Arrogant","Boastful","Bossy","Boring","Careless","Clingy","Cruel","Cowardly",
				"Deceitful","Dishonest","Fussy","Greedy","Grumpy","Harsh","Impatient","Impulsive","Jealous","Moody","Narrow-minded","Overcritical",
				"Rude","Selfish","Untrustworthy"};
		bayes.learn("Negative", Arrays.asList(Negative));
		
		   
		 
		String Neutral[]={"blissful","joyous","delighted","overjoyed","gleeful","thankful","festive",
				"satisfied","pleased","sunny","elated","jubilant","jovial","fun-loving","lighthearted",
				"glorious","innocent","child-like","gratified","euphoric","playful","spirited","wonderful",
				"funny","helpful","joyful","enjoy","peaceful","super","good","nice","best","better","superb",
				"love","lovely","lovable","adorable","fun","outstanding","important","necessary","awesome",
				"cute","charming","great","greater","greatest","congratulations","congratulate","congrats",
				"dear","happy"};
		bayes.learn("Neutral", Arrays.asList(Neutral));
		String Positive[]={"accurate","instantly","advantage","always","certain","certainly","confident",
				"convenient","effective","effectively","definitely","emphasize","extremely","investment","approving",
				"honored","privileged","adaptable","assured","reliable","authentic","honest","truthful",
				"transparency","responsible","truth","proud","crispness","brevity","bravest","trust","trusty",
				"trustworthy","true","honorable","exemplary","dignified","crucial","greatful","grateful","active","energetic","full of pep","lively","vigorous","cheerful","carefree",
				"alert","courageous","liberated","optimistic","animated","intelligent","creative",
				"constructive","strong","praise","gratitude","thank","thankful","quick","fast","speedy",
				"powerful"};
		bayes.learn("Positive", Arrays.asList(Positive));
		String words="";		
		String sentence="";
		try{
		if(twitList.size()>0){
			for(int i=0;i<twitList.size();i++){	
				sentence="";
				words=twitList.get(i).getMessage();
				words=words.toLowerCase();
				words=words.replace(".","");
				words=words.replace(",","");
				words=words.replace("!","");
				//words=words.replace(":d","");
				words=words.replace(":)","");
				words=words.replace(":","");
				words=words.replace(";","");
				words=words.replace("?","");
				//words=words.replace("'","");
				words=words.replace("*","");
				words=words.replace("^","");
				words=words.replace("<3","");				
				String word[]=words.split("\\s+");
				String bayesResult = bayes.classify(Arrays.asList(word)).getCategory();
				double bayesProbability = bayes.classify(Arrays.asList(word)).getProbability();
				
				for(int j=0;j<word.length;j++){
					word[j]=removeDup(word[j]);
				}
				
				
				Tweet twit = new Tweet();
				twit.setTweetId(twitList.get(i).getTweetId());
				twit.setMessage(twitList.get(i).getMessage());
				twit.setSetResult(bayesResult);
				twit.setBayesProbability(bayesProbability);
				for(int j=0;j<word.length;j++){
					Porter porter = new Porter();
					word[j]=porter.stripSuffixes(word[j]);
					sentence = sentence + word[j]+" ";
				}
				twit.setStemming(sentence);
				String str1[] = sentence.split("\\s+");
				String str2="";
				for(int k=0;k<str1.length;k++){
		        	StopWords stop=new StopWords();
		        	
		        	String result=stop.remove(str1[k]);
		        	if(result!=null&&result!="")
		        	str2 = str2 + result + " ";
		        }
				twit.setResult(str2);
				twitList.set(i, twit);
			}
			HttpSession session = request.getSession();
			session.setAttribute("twitList", twitList);
			RequestDispatcher rd = request.getRequestDispatcher("tweet_classification.jsp");
			rd.forward(request, response);
		}else{
			request.setAttribute("ErrMsg", "There are no records");
			RequestDispatcher rd = request.getRequestDispatcher("tweet_classification.jsp");
			rd.forward(request, response);
		}	
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public  String removeDup(String str){
		str = str + " "; // Adding a space at the end of the word
        int l=str.length(); // Finding the length of the word
		String ans="";
		char ch1,ch2;
				 
        for(int i=0; i<l-1; i++)
        {
            ch1=str.charAt(i); // Extracting the first character
            ch2=str.charAt(i+1); // Extracting the next character
 
// Adding the first extracted character to the result if the current and the next characters are different
            int count= countRun(str, ch1);
            if(count==2){
            	ans = ans + ch1;
            }else if(ch1!=ch2){            
            	ans = ans + ch1;
            }            
        }
	    return ans;
    }
	public static int countRun( String s, char c )
	{
	    int counter = 0;
	    for( int i = 0; i < s.length(); i++)
	    {
	      if( s.charAt(i) == c )  counter++;
	      else if(counter>0) break;
	    }
	    return counter;
	}
	public static ArrayList<String> ngrams(int n, String str) {
		ArrayList<String> ngrams = new ArrayList<String>();
	    String[] words = str.split("\\s");
	    for (int i = 0; i < words.length; i++)
	    	ngrams.add(concat(words, i, i+n));
	    System.out.println(ngrams.toString());
	     return ngrams;
	     
	}

	    public static String concat(String[] words, int start, int end) {
	        StringBuilder sb = new StringBuilder();
	        for (int i = start; i < end; i++)
	            sb.append((i > start ? " " : "") + words[i]);
	        System.out.println(sb.toString());
	        return sb.toString();
	    }	

}
