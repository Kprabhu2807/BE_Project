package com.twitter.model;

import java.io.IOException;
import java.util.Collection;
import java.util.Comparator;
import java.util.SortedSet;
import java.util.TreeSet;

import weka.classifiers.Evaluation;
import weka.core.Instances;
import weka.core.converters.ArffLoader;

public class Classification<T, K> extends UserTweetClassifier<T, K> {

	
	public static Instances getDataSet(String fileName) throws IOException {
		/**
		 * we can set the file i.e., loader.setFile("finename") to load the data
		 */
		int classIdx = 1;
		/** the arffloader to load the arff file */
		ArffLoader loader = new ArffLoader();
		/** load the traing data */
		
		//loader.setFile(new File(fileName));
		Instances dataSet = loader.getDataSet();
		/** set the index based on the data given in the arff files */
		dataSet.setClassIndex(classIdx);
		return dataSet;
	}

	
   
    private float featuresProbabilityProduct(Collection<T> features,
            K category) {
        float product = 1.0f;
        for (T feature : features)
            product *= this.featureWeighedAverage(feature, category);
        return product;
    }

    
    private float categoryProbability(Collection<T> features, K category) {
        return ((float) this.categoryCount(category)
                    / (float) this.getCategoriesTotal())
                * featuresProbabilityProduct(features, category);
    }

   
    private SortedSet<ClassificationData<T, K>> categoryProbabilities(
            Collection<T> features) {

       
        SortedSet<ClassificationData<T, K>> probabilities =
                new TreeSet<ClassificationData<T, K>>(
                        new Comparator<ClassificationData<T, K>>() {

                    @Override
                    public int compare(ClassificationData<T, K> o1,
                            ClassificationData<T, K> o2) {
                        int toReturn = Float.compare(
                                o1.getProbability(), o2.getProbability());
                        if ((toReturn == 0)
                                && !o1.getCategory().equals(o2.getCategory()))
                            toReturn = -1;
                        return toReturn;
                    }
                });

        for (K category : this.getCategories())
            probabilities.add(new ClassificationData<T, K>(
                    features, category,
                    this.categoryProbability(features, category)));
        return probabilities;
    }

    
    @Override
    public ClassificationData<T, K> classify(Collection<T> features) {
        SortedSet<ClassificationData<T, K>> probabilites =
                this.categoryProbabilities(features);

        if (probabilites.size() > 0) {
            return probabilites.last();
        }
        return null;
    }

    public Collection<ClassificationData<T, K>> classifyDetailed(
            Collection<T> features) {
        return this.categoryProbabilities(features);
    }
    
    

}
