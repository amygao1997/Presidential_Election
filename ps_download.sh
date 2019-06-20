# download the files and put them in the data directory
wget -N --no-check-certificate https://cg-519a459a-0ea3-42c2-b7bc-fa1143481f74.s3-us-gov-west-1.amazonaws.com/bulk-downloads/2020/cn20.zip -P data
wget -N --no-check-certificate https://cg-519a459a-0ea3-42c2-b7bc-fa1143481f74.s3-us-gov-west-1.amazonaws.com/bulk-downloads/2020/oppexp20.zip -P data
wget -N --no-check-certificate https://cg-519a459a-0ea3-42c2-b7bc-fa1143481f74.s3-us-gov-west-1.amazonaws.com/bulk-downloads/2020/indiv20.zip -P data
wget -N --no-check-certificate https://cg-519a459a-0ea3-42c2-b7bc-fa1143481f74.s3-us-gov-west-1.amazonaws.com/bulk-downloads/2020/pas220.zip -P data
wget -N --no-check-certificate https://cg-519a459a-0ea3-42c2-b7bc-fa1143481f74.s3-us-gov-west-1.amazonaws.com/bulk-downloads/2020/oth20.zip -P data
wget -N --no-check-certificate https://cg-519a459a-0ea3-42c2-b7bc-fa1143481f74.s3-us-gov-west-1.amazonaws.com/bulk-downloads/2020/ccl20.zip -P data
wget -N --no-check-certificate https://cg-519a459a-0ea3-42c2-b7bc-fa1143481f74.s3-us-gov-west-1.amazonaws.com/bulk-downloads/2020/cm20.zip -P data

# unzip files and put them in the data directory
find data -type f -name "*.zip" -exec unzip -o -d data {} \;

# find and remove duplicates
grep -n --context=3 "H8GA04117" data/cn.txt 
grep -n --context=3 "H8GA04117" data/cm.txt 
sed -i -e '1844d' data/cn.txt
sed -i -e '7700d' data/cm.txt
