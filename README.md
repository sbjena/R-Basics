# R-Basics
Basic Examples  Using R framework

T- Test
	Paired Sample T- Test
		When We do sampling on same sample.
		Ex:- Before and after weight loss
	One Sample T-Test 
		We will check if Mean is stated mean or not.
	Independent Sample T-Test
		Two Separate pollution we are comparing 
		Ex :- Like Variance 
If we have more than Two population , ?
	Annova

Example toss_ipl.csv 
Q . Is there any relation between winning a toss and winning a match ?
	Explanation :- If 80 percentage times winning a toss means chance of winning a match then it hold true.
Q Out of 600 matches , there are 6 ball per over , find avg score scored per ball in a over ? 
	Explanation :- What is our thought , on first ball one score more or middle in a over score more or last  in an over.
	
	Y ~ X   
	means Avg Score depend  ~  on Ball Number in a Over (it is a factor , each Over is having 6 balls)
		Each over there is 6 balls from 1 to 6 so it is a factor.
	(In this case Null Hypothesis says there is no difference between average of 1st , 2nd , 3rd ball in an over , it means mean 1st ball = means 2nd ball = …..)
	Alternate says they are not same , we will find P value  to find it out .
	
	Hint :- Local team have more chances of winning the match 
		Winning  ~ Team
		Yes/No        Local/ Visitor 
		Factor	    Factor
		
	If both are Factor then we will use Chi square 
	
	Cross TAB
		If we have more two or more than two categorical parameter then that are categorical or grouped
		Variable has to be categorical or grouped , we cannot have continuous variable , we if will have continuous variable we have to put them in a bucket with a new column 
	
	Gender\Education	UG	PG	PHD
	M	520	105	10
	F	350	70	1
	
	Study now 
	
		Education depend on Gender or not ?
	
	Q  Age vs Diabetics
		
		Age	Diabetics 
		35	N
		62	Y
		22	y
		We have to put age in a bucket
