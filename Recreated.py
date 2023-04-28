import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression, Ridge, Lasso, ElasticNet
from sklearn.metrics import mean_squared_error
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA
from sklearn.pipeline import Pipeline
from statsmodels.formula.api import ols
from statsmodels.graphics.gofplots import qqplot

# Load the data
data_2011 = pd.read_csv("bikedata2011.csv")
data_2012 = pd.read_csv("bikedata2012.csv")

# Exploratory data analysis
sns.pairplot(data_2011, vars=["count", "temp", "hum", "windspeed"], diag_kind="kde")
plt.show()

# Split the data into train and test sets
train_data = data_2012.sample(frac=0.8, random_state=42)
test_data = data_2012.drop(train_data.index)

# Linear regression
X_train = train_data[["temp", "hum", "windspeed"]]
y_train = train_data["count"]
X_test = test_data[["temp", "hum", "windspeed"]]
y_test = test_data["count"]

lr = LinearRegression()
lr.fit(X_train, y_train)

print(f"Linear regression coefficients: {lr.coef_}")
print(f"Linear regression intercept: {lr.intercept_}")
print(f"Linear regression score (R-squared): {lr.score(X_test, y_test)}")
print(f"Linear regression MSE: {mean_squared_error(y_test, lr.predict(X_test))}")

# Ridge regression
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)

ridge = Ridge(alpha=1)
ridge.fit(X_train_scaled, y_train)

print(f"Ridge regression coefficients: {ridge.coef_}")
print(f"Ridge regression intercept: {ridge.intercept_}")
print(f"Ridge regression score (R-squared): {ridge.score(X_test_scaled, y_test)}")
print(f"Ridge regression MSE: {mean_squared_error(y_test, ridge.predict(X_test_scaled))}")

# Lasso regression
lasso = Lasso(alpha=1)
lasso.fit(X_train_scaled, y_train)

print(f"Lasso regression coefficients: {lasso.coef_}")
print(f"Lasso regression intercept: {lasso.intercept_}")
print(f"Lasso regression score (R-squared): {lasso.score(X_test_scaled, y_test)}")
print(f"Lasso regression MSE: {mean_squared_error(y_test, lasso.predict(X_test_scaled))}")

# Elastic Net regression
enet = ElasticNet(alpha=1, l1_ratio=0.5)
enet.fit(X_train_scaled, y_train)

print(f"Elastic Net regression coefficients: {enet.coef_}")
print(f"Elastic Net regression intercept: {enet.intercept_}")
print(f"Elastic Net regression score (R-squared): {enet.score(X_test_scaled, y_test)}")
print(f"Elastic Net regression MSE: {mean_squared_error(y_test, enet.predict(X_test_scaled))}")

# Principal component analysis
pca_pipe = Pipeline([
    ("scaler", StandardScaler()),
    ("pca", PCA())
])
pca_pipe.fit(X_train)
explained_variance = pca_pipe.named_steps["pca"].explained_variance_ratio_
print(f"Explained variance: {explained_variance}")
plt.bar(range(1, len(explained_variance) + 1), explained_variance)
plt.show()

# Multiple linear regression with transformed
