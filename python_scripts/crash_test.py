import pandas as pd

if __name__ == "__main__":    

    df = pd.read_csv("../data/dummy_leads_data.csv")
    print(df.head())
