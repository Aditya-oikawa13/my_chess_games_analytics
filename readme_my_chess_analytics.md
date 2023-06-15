<h1 align="center">
MY CHESS GAMES ANALYSIS
</h1>

Hello everyone, so this the project in which I analyze my chess games extracted from [Lichess//Aditya.](https://lichess.org/@/Aditya_2208) I used extract feature availabel in lichess to extract your games.

The exctracted data looked like this:

<span style="color:darkcyan ;font-courier:700;font-size:10px">
   [Event "GM HomayooonT Prize Arena"]
[Site "https://lichess.org/Ef9FNGFu"]
[Date "2023.06.13"]
[White "Aditya_2208"]
[Black "blomen"]
[Result "1-0"]
[UTCDate "2023.06.13"]
[UTCTime "16:47:45"]
[WhiteElo "1760"]
[BlackElo "1157"]
[WhiteRatingDiff "+0"]
[BlackRatingDiff "+0"]
[Variant "Standard"]
[TimeControl "180+0"]
[ECO "A00"]
[Opening "Hungarian Opening"]
[Termination "Time forfeit"]

1. g3 { [%clk 0:01:30] } 1... d5 { [%clk 0:03:00] } 2. Bg2 { [%clk 0:01:30] } 2... Nf6 { [%clk 0:02:59] } 3. c3 { [%clk 0:01:29] } 3... Bf5 { [%clk 0:02:54] } 4. Qb3 { [%clk 0:01:28] } 4... Bxb1 { [%clk 0:02:52] } 5. Rxb1 { [%clk 0:01:23] } 5... b6 { [%clk 0:02:36] } 6. Nf3 { [%clk 0:01:20] } 6... e6 { [%clk 0:02:28] } 7. Nd4 { [%clk 0:01:19] } 7... Bc5 { [%clk 0:02:23] } 8. d3 { [%clk 0:01:18] } 8... Bxd4 { [%clk 0:02:22] } 9. cxd4 { [%clk 0:01:18] } 9... O-O { [%clk 0:02:19] } 10. e4 { [%clk 0:01:17] } 10... dxe4 { [%clk 0:02:18] } 11. dxe4 { [%clk 0:01:16] } 11... Qxd4 { [%clk 0:02:15] } 12. Be3 { [%clk 0:01:15] } 12... Qd6 { [%clk 0:02:01] } 13. e5 { [%clk 0:01:14] } 13... Qxe5 { [%clk 0:01:56] } 14. Bb7 { [%clk 0:01:12] } 14... Nbd7 { [%clk 0:01:35] } 15. Bxa8 { [%clk 0:01:10] } 15... Rxa8 { [%clk 0:01:35] } 16. O-O { [%clk 0:01:10] } 16... Ng4 { [%clk 0:01:32] } 17. Bf4 { [%clk 0:01:08] } 17... Qh5 { [%clk 0:01:17] } 18. h4 { [%clk 0:01:07] } 18... e5 { [%clk 0:01:11] } 19. Bd2 { [%clk 0:01:03] } 19... h6 { [%clk 0:01:07] } 20. Qf3 { [%clk 0:01:01] } 20... Qg6 { [%clk 0:01:02] } 21. Qxa8+ { [%clk 0:00:59] } 21... Kh7 { [%clk 0:00:57] } 22. Rbd1 { [%clk 0:00:58] } 22... Ndf6 { [%clk 0:00:39] } 23. Bc3 { [%clk 0:00:56] } 23... Ne4 { [%clk 0:00:23] } 24. Rd8 { [%clk 0:00:52] } 24... Qf6 { [%clk 0:00:08] } 25. Rh8+ { [%clk 0:00:50] } 25... Kg6 { [%clk 0:00:08] } 26. f3 { [%clk 0:00:49] } 26... Nxg3 { [%clk 0:00:01] } 27. Bxe5 { [%clk 0:00:44] } 27... Qxe5 { [%clk 0:00:00] } 28. fxg4 { [%clk 0:00:40] } 28... Qe4 { [%clk 0:00:00] } 29. Qxe4+ { [%clk 0:00:38] } 1-0 


</span>

## Steps for preprocessing of data and creating a good readable excel file  from it.

* This the data of single game, like this there were 6179 games. 

* I used a blank excel workbook and used "Get data from text". I transformed the data by using tab as a delimiter to form a table. 


* Then I used "extract text between" to get two columns one with headings and other with actual data.

* I got rid of irrelevant data like clock time and moves for this project.


* I loaded the data and inserted a table. Then filtered all the values and transposed them to form a sheet that looked like this:

<img src="excelsnip.png" 
        alt="Picture" 
        width="800" 
        height="200" 
        style="display: block; margin: 0 auto" />


