package com.twitter.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.twitter.RF.MyFilteredClassifier;
import com.twitter.RF.MyFilteredLearner;
import com.twitter.bean.RealTweetStream;

/**
 * Servlet implementation class SentimentAnalysisRF
 */
@WebServlet("/SentimentAnalysisRF")
public class SentimentAnalysisRF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SentimentAnalysisRF() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MyFilteredLearner learner = new MyFilteredLearner();
		learner.loadDataset("C:\\Users\\preet\\OneDrive\\Desktop\\LY_Project\\workspace\\CovidSentimentAnalysis\\WebContent\\upload\\train_off.arff");
		// Evaluation must be done before training
		// More info in: http://weka.wikispaces.com/Use+WEKA+in+your+Java+code
		learner.evaluate();
		learner.learn();
		learner.saveModel("C:\\Users\\preet\\OneDrive\\Desktop\\LY_Project\\workspace\\CovidSentimentAnalysis\\WebContent\\upload\\rf.dat");
		MyFilteredClassifier classifier = new MyFilteredClassifier();
		classifier.load("C:\\Users\\preet\\OneDrive\\Desktop\\LY_Project\\workspace\\CovidSentimentAnalysis\\WebContent\\upload\\test_real.txt");
		classifier.loadModel("C:\\Users\\preet\\OneDrive\\Desktop\\LY_Project\\workspace\\CovidSentimentAnalysis\\WebContent\\upload\\rf.dat");
		classifier.makeInstance();
		classifier.classify();
		ArrayList<String> result=new ArrayList<String>();
		result.addAll(MyFilteredClassifier.classifyTweet);
		ArrayList<Double> resultProb=new ArrayList<Double>();
		resultProb.addAll(MyFilteredClassifier.predProb);
		ArrayList<RealTweetStream> tweetStreamList = (ArrayList<RealTweetStream>)session.getAttribute("RealTweetStream");
		if(tweetStreamList!=null && tweetStreamList.size()>0){
			for(int i=0;i<tweetStreamList.size();i++){
				tweetStreamList.get(i).setResult(result.get(i));
				tweetStreamList.get(i).setResultProb(resultProb.get(i));
			}
			double positive=0.0;
			double negative=0.0;
			for(int i=0;i<tweetStreamList.size();i++){
				if(tweetStreamList.get(i).getResult().equals("Negative"))
					positive++;
				else
					negative++;
			}
			
		
			RequestDispatcher rd=request.getRequestDispatcher("adminclassify.jsp");
			rd.forward(request, response);
		}else{
			request.setAttribute("ErrMsg", "Could not classify tweets");
			RequestDispatcher rd=request.getRequestDispatcher("admin_home.jsp");
			rd.forward(request, response);
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
