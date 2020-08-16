import numpy as np
import pandas as pd
import pickle
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import confusion_matrix

if __name__ == "__main__":
    # Importing the dataset
    df = pd.read_csv('dummy_leads_data.csv')
    # Shuffling the data
    df = df.sample(frac=1).reset_index(drop=True)
    
    X = df.iloc[:, 0:9].values
    y = df.iloc[:, 9].values
    X_train, X_test, y_train, y_test = train_test_split(X, y, stratify=y, test_size = 0.25, random_state = 42)

    # sc = StandardScaler()
    # X_train = sc.fit_transform(X_train)
    # X_test = sc.transform(X_test)

    classifier = RandomForestClassifier(n_estimators = 300, criterion = 'entropy', random_state = 42)
    classifier.fit(X_train, y_train)

    y_pred = classifier.predict(X_test)

    cm = confusion_matrix(y_test, y_pred)

    pickle.dump(classifier , open('..//data//model.pkl', 'wb'))

    loaded_model = pickle.load(open('..//data//model.pkl', 'rb'))
    result = loaded_model.score(X_test, y_test)
    print(result)
    print(cm)