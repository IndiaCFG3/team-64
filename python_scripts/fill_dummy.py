import pandas as pd
import numpy as np
import random

__all__ = ["fill_missing"]

fill_int_dict = {
    'program_id' : [1, 30],
    'age' : [5, 40],
    'distance' : [100, 8000],
    'mobilizer_id' : [1, 25],
    'last_contact' : [1, 250],
    "gender" : [0, 2],
    "earning" : [0, 2],
    "education" : [0, 2],
    # 'sucess_rate' : [0.1, 0.9],
    'is_lead' : [0, 2],
}

fill_float_dict = {
    'sucess_rate' : [0.1, 0.9],
}


def fill_missing(csv_path, fill_int_dict, fill_float_dict, nrows):
    df = pd.read_csv(csv_path)    
    for key in fill_int_dict.keys():
        item_min = fill_int_dict[key][0]
        item_max = fill_int_dict[key][1]
        # print(item_min)
        # print(type(item_min))
        df[key] = np.random.randint(item_min, item_max, df.shape[0])
    
    for key in fill_float_dict.keys():
        item_min = fill_float_dict[key][0]
        item_max = fill_float_dict[key][1]
        # print(item_min)
        # print(type(item_min))
        df[key] = np.random.uniform(item_min, item_max, df.shape[0])
        
    df.to_csv("../data/dummy_leads_data.csv", index=False)
    return df


if __name__ == "__main__":
    df = fill_missing("..//data//Future_Leads_Prediction.csv", fill_int_dict, fill_float_dict, nrows=1000)




