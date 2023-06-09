X=5
Y=10
result=0
for VARIABLE in $(seq $X)
do
    result=$(($result + $Y))
done
echo $result;
