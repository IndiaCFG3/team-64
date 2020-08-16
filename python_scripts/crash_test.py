import pandas as pd
import pickle

if __name__ == "__main__":    

    # df = pd.read_csv("../data/dummy_leads_data.csv")
    # print(df.head())

    with open("..//data//model.pkl", "rb") as f:
        model = pickle.load(f)
        print("Model Loaded")

        df = pd.read_csv("..//data//dummy_leads_data.csv")
        X = df.iloc[:, 0:9].values[42]
        X = X.reshape(1, -1)

        out = model.predict(X)

        class_id = out[0]

        print(out)
    

