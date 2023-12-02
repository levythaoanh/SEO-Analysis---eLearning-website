with map_table as (
	select Email, Type , Name , `MA URL` , `MA Referrer` , ma_path , `IP Address` , Date,
	        STR_TO_DATE(Date, '%d/%m/%Y %H:%i') as Date_1, STR_TO_DATE(Date, '%d-%m-%Y %H:%i') as Date_2
	from uniace1
	union all
	select Email, Type , Name , `MA URL` , `MA Referrer` , ma_path , `IP Address` , Date,
	        STR_TO_DATE(Date, '%d/%m/%Y %H:%i') as Date_1, STR_TO_DATE(Date, '%d-%m-%Y %H:%i') as Date_2
	from uniace2
	union all
	select Email, Type , Name , `MA URL` , `MA Referrer` , ma_path , `IP Address` , Date,
	        STR_TO_DATE(Date, '%d/%m/%Y %H:%i') as Date_1, STR_TO_DATE(Date, '%d-%m-%Y %H:%i') as Date_2
	from uniace3
)
select Email, Type , Name , `MA URL` , `MA Referrer` , ma_path , `IP Address`,
	Date, 
	case 
		when ISNULL(Date_1) then Date_2
		when ISNULL(Date_2) then Date_1
	else Date
	end as date_time
from map_table