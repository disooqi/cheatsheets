# Extract the target column
y = df.pop('Risk1Yr').values

# Show the first few lines of the Dataframe
print(df.head())

# Get the frequency of the elements of the columns 
print(df['PRE7'].value_counts())

# force Pandas to create a one-column DataFrame instead of Pandas Series
print(df[['PRE7']].copy())  

ohe = ml_pipeline.named_steps['ohe']
print(ohe.get_feature_names())
print(ohe.inverse_transform(hs_dataset_transformed))  # get you back your original data
