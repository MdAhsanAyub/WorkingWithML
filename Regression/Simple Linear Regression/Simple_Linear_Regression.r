# simple linear regression

# Importing the dataset
dataset = read.csv('Salary_Data.csv')
# dataset = dataset[, 2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting simple linear regression to the training set
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

# predicting the test set results
y_pred = predict(regressor, newdata = test_set)

# Visualizing the Training Set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Years of Experience (Tranining Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

# Visualizing the Test Set results
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Years of Experience (Tranining Set)') +
  xlab('Years of Experience') +
  ylab('Salary')