/*Queries Ranking Top 10/995 Youtubers on Subs and AVG Yearly Earnings*/

Select [Youtuber], [subscribers] 
from YouTube_GlobalCreatorAndContent_Analysis..['Global_YouTube_Statistics']
where [rank]<=10 ;

Select [Youtuber], ([highest_yearly_earnings]+[lowest_yearly_earnings])/2 as 'AVG Yearly Earnings', [Country] 
from YouTube_GlobalCreatorAndContent_Analysis..['Global_YouTube_Statistics']
ORDER BY [highest_yearly_earnings] DESC;

/*Identifying those Youtubers who's AVG annual earnings contribute 
more than 1% of the total AVG earnings of the top 995 Youtubers*/
Select [Rank], [Youtuber], ([highest_yearly_earnings]+[lowest_yearly_earnings])/2 as 'AVG Yearly Earnings', [Country] 
from YouTube_GlobalCreatorAndContent_Analysis..['Global_YouTube_Statistics']
where (([highest_yearly_earnings]+[lowest_yearly_earnings])/2)>=(0.01*3743225820)
ORDER BY 'AVG Yearly Earnings' DESC;

/*Queries on Categories' Annual Earnings, 
ranking on AVG Annual Earnings in each Category and Total Annual Earnings*/
Select [category], AVG((highest_yearly_earnings + lowest_yearly_earnings)/2) [AVG Yearly Earning]
from YouTube_GlobalCreatorAndContent_Analysis..['Global_YouTube_Statistics']
GROUP BY [category] ORDER BY AVG(highest_yearly_earnings) DESC;

Select [category], SUM((highest_yearly_earnings + lowest_yearly_earnings)/2) [SUM Yearly Earning]
from YouTube_GlobalCreatorAndContent_Analysis..['Global_YouTube_Statistics']
GROUP BY [category] ORDER BY SUM(highest_yearly_earnings) DESC;

/*Queries on Country's: Population, Population Earning over AVG, AVG Earning Per Country, Youtuber Population Density*/
Select [Country], COUNT(Youtuber) 
from YouTube_GlobalCreatorAndContent_Analysis..['Global_YouTube_Statistics']
GROUP BY [Country] ORDER BY COUNT(Youtuber) DESC;

Select [Country], COUNT(Youtuber) 
from YouTube_GlobalCreatorAndContent_Analysis..['Global_YouTube_Statistics']
where (([highest_yearly_earnings]+[lowest_yearly_earnings])/2)>=3762035.65603015
GROUP BY [Country] ORDER BY COUNT(Youtuber) DESC;

Select [Country], (AVG(highest_yearly_earnings)+AVG(lowest_yearly_earnings))/COUNT(Youtuber) as 'AVG Annual Earnings'
from YouTube_GlobalCreatorAndContent_Analysis..['Global_YouTube_Statistics']
GROUP BY [Country] ORDER BY 'AVG Annual Earnings' DESC;

Select [Country], COUNT(Youtuber)/AVG(Population) as 'Youtuber Density'
from YouTube_GlobalCreatorAndContent_Analysis..['Global_YouTube_Statistics']
GROUP BY [Country] ORDER BY 'Youtuber Density' DESC;

/*AVG Yearly Earnings*/
Select ((SUM(highest_yearly_earnings)+SUM(lowest_yearly_earnings))/1990) as 'AVG Earnings'
from YouTube_GlobalCreatorAndContent_Analysis..['Global_YouTube_Statistics'];