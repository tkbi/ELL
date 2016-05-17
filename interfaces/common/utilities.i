////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Project:  Embedded Machine Learning Library (EMLL)
//  File:     utilities.i (interfaces)
//  Authors:  Chuck Jacobs
//
////////////////////////////////////////////////////////////////////////////////////////////////////

%module utilities

%include "stl.i"

%ignore utilities::operator<<;
%ignore utilities::MakeAnyIterator;
%ignore utilities::IteratorWrapper;

%{
#define SWIG_FILE_WITH_INIT
#include "BinaryClassificationEvaluator.h"
//#include "IIterator.h"
#include "AnyIterator.h"
#include "RandomEngines.h"
#include "StlIterator.h"

#include "LogLoss.h"
#include "HingeLoss.h"
#include "SquaredLoss.h"
%}

%include "BinaryClassificationEvaluator.h"
//%include "IIterator.h"
%include "AnyIterator.h"
%include "RandomEngines.h"

// This is necessary for us to avoid leaking memory:
// %template (SupervisedExampleIterator) utilities::AnyIterator<dataset::SupervisedExample<dataset::IDataVector>>;

template <typename IteratorType, typename ValueType> class StlIterator {};

// TODO: need to make SWIG aware of utilities::IBinaryClassificationEvaluator<predictors::LinearPredictor>::ExampleIteratorType
// and that it's the same as dataset::GenericRowDataset::Iterator
// ... which is the same as utilities::VectorIterator<ExampleType>;

%template () utilities::IBinaryClassificationEvaluator<predictors::LinearPredictor>;
%template (LinearLogLossClassificationEvaluator) utilities::BinaryClassificationEvaluator<predictors::LinearPredictor, lossFunctions::LogLoss>;
%template (LinearHingeLossClassificationEvaluator) utilities::BinaryClassificationEvaluator<predictors::LinearPredictor, lossFunctions::HingeLoss>;
%template (LinearSquaredLossClassificationEvaluator) utilities::BinaryClassificationEvaluator<predictors::LinearPredictor, lossFunctions::SquaredLoss>;


    // template<typename PredictorType, typename LossFunctionType>
    // class BinaryClassificationEvaluator : public IBinaryClassificationEvaluator<PredictorType>
    // 
    // virtual void Evaluate(typename IBinaryClassificationEvaluator<PredictorType>::ExampleIteratorType& dataIterator, const PredictorType& predictor) override;

