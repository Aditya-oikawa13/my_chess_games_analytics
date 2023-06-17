--       SQL QUERIES TO ANALYZE MY CHESS GAMES

-- table structure:
select * from chess_data

--Creating a game_id column to identify each game separately.
alter table chess_data
add game_id int identity(1,1)

select * from chess_data

-- No. of games in database.
select count(game_id) from chess_data

--no. of games as white
select count(game_id) as no_of_white_games
from chess_data 
where white = 'Aditya_2208'

-- no. of games as black
select count(game_id) as no_of_black_games
from chess_data 
where black = 'Aditya_2208'

-- total no. of games:
select count(game_id)
from chess_data

-- percentage of game win with white 
select 
Round(cast(sum(case when white = 'Aditya_2208' and whit_result = 1 then 1 else 0 end)as float)/
cast(sum(case when white = 'Aditya_2208' then 1 else 0 end) as float)*100,2)
as Percentage_win_with_white
from chess_data

--percentage win with black
select 
Round(cast(sum(case when Black = 'Aditya_2208' and Black_Result = 1 then 1 else 0 end)as float)/
cast(sum(case when Black = 'Aditya_2208' then 1 else 0 end) as float)*100,2)
as Percentage_win_with_white
from chess_data


--percentage of drawn games
select
Round(cast(sum(case when Black_Result = 0.5 then 1 else 0 end)as float)/
cast(count(game_id) as float)*100,2)
as percentage_of_drawn_games
from chess_data

-- Checking for null values in white_elo
select white_elo
from chess_data
where White_Elo is null

-- replacing null values with 1500 in white_elo
update chess_data
set white_elo = 1500
where White_Elo is null

-- average elo of opponent with white
select round(avg(case when black = 'Aditya_2208' then white_elo end),0)
from chess_data

-- average elo of opponent with white when Aditya won, lost and drawn
select round(avg(case when black = 'Aditya_2208' and Black_Result = 1  then white_elo end),0) as won,
round(avg(case when black = 'Aditya_2208' and Black_Result = 0  then white_elo end),0) as lost,
round(avg(case when black = 'Aditya_2208' and Black_Result = 0.5  then white_elo end),0) as drawn
from chess_data

-- Checking for null values in black_elo
select black_elo
from chess_data
where black_Elo is null

-- replacing null values with 1500 in black_elo
update chess_data
set black_elo = 1500
where black_Elo is null

-- average elo of opponent with black
select round(avg(case when white = 'Aditya_2208' then black_elo end),0)
from chess_data

-- average elo of opponent with balck when Aditya won, lost and drawn
select round(avg(case when white = 'Aditya_2208' and Whit_Result = 1  then Black_Elo end),0) as won,
round(avg(case when white = 'Aditya_2208' and Whit_Result = 0  then Black_Elo end),0) as lost,
round(avg(case when White = 'Aditya_2208' and Whit_Result = 0.5  then Black_Elo end),0) as drawn
from chess_data


-- setting date column to date data type
alter table dbo.chess_data
alter column utc_date date


performance wins vs games played in last two months
select
count(case when white = 'Aditya_2208' and whit_result = 1 then game_id
when black = 'Aditya_2208' and Black_Result = 1 then game_id
end) WINS ,
count(case when white = 'Aditya_2208' then game_id 
when black = 'Aditya_2208'  then game_id end) GAMES_PALYED
from chess_data
where datediff(month,utc_date,cast(getdate() as date)) <= 2


-- Rating progression of aditya month-wise
select format(utc_date, 'yy-MM') as month_wise,  avg(case 
when white = 'Aditya_2208' then white_elo
when black = 'Aditya_2208' then black_elo
end) as rating
from chess_data
group by format(utc_date, 'yy-MM') 
order by format(utc_date, 'yy-MM') 

-- no. of matches played in different events:
select event, count(game_id) as games_played
from chess_data
group by EVENT
order by count(game_id) desc

-- no. of matches played in different openings:
select Opening, count(game_id) as games_played
from chess_data
group by Opening
order by count(game_id) desc

-- opening preferences over the time
select format(utc_date, 'yy-MM') as month_wise, 
Opening, count(game_id) as games_played
from chess_data
group by format(utc_date, 'yy-MM'),Opening 
having count(game_id)>=10
order by format(utc_date, 'yy-MM'), count(game_id) desc

--changing time_control to game_format
update chess_data
set time_control = 'Bullet'
where time_control in ('120+1','15+0','30+0','60+5','60+1','60+2',
'60+0')

update chess_data
set time_control = 'Blitz'
where time_control in ('360+3','180+3','300+5','180+6','300+2','300+8',
'240+3','180+1', '180+5')

update chess_data
set time_control = 'Rapid'
where time_control in ('900+0','900+3','900+5','900+10' )

update chess_data
set time_control = 'Correspondence'
where time_control in ('-','1800+0' )

--changing column name to a more suitable name
EXEC sp_rename 
   @objname = 'chess_data.Time_control',
   @newname = 'Time_Format',
   @objtype = 'COLUMN';

-- Time format wise win percentage
select time_format, 
round(count(case when black = 'Aditya_2208' and black_result = 1 then 1 end)*100/cast (count(case when black = 'Aditya_2208' then 1 end) as float), 2) as black_win_percentage,
round(count(case when White = 'Aditya_2208' and whit_result = 1 then 1 end)*100/cast (count(case when White = 'Aditya_2208' then 1 end) as float),2) as white_win_percentage
from chess_data
group by Time_Format 
order by black_win_percentage desc, white_win_percentage desc


