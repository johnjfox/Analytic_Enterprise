# Classification of Whiskies
## Data Source
[University of Strathclyde, Dept of Statistics](https://www.mathstat.strath.ac.uk/outreach/nessie/nessie_whisky.html)

## Description
86 malt whiskies are scored between 0-4 for 12 different taste categories including sweetness, smoky, nutty etc. In addition, coordinates of distilleries are provided us to obtain pairwise distance information. Using a combination of these datasets it is possible to look for correlations between particular attributes of taste and physical location, for example does a shared local resource have a significant effect on nearby whiskies.

## Files Provided
- **whiskies.csv**: scores for 86 whiskies measured in various taste categories
- **description.md**: this file

## Data Dictionary
- **RowID**: (integer) index
- **Distillery**: (string) name of distillery
- **Body**: (integer) taste score between 0-4
- **Sweetness**: (integer) taste score between 0-4
- **Smoky**: (integer) taste score between 0-4
- **Medicinal**: (integer) taste score between 0-4
- **Tobacco**: (integer) taste score between 0-4
- **Honey**: (integer) taste score between 0-4
- **Spicy**: (integer) taste score between 0-4
- **Winey**: (integer) taste score between 0-4
- **Nutty**: (integer) taste score between 0-4
- **Malty**: (integer) taste score between 0-4
- **Fruity**: (integer) taste score between 0-4
- **Floral**: (integer) taste score between 0-4
- **Postcode**: (integer) taste score between 0-4
- **Latitude**: latitude of distillery in Great Britain's Ordnance Survey National Grid reference system
- **Longitude**: longitude of distillery in Great Britain's Ordnance Survey National Grid reference system
