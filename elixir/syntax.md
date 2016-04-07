
multiple statements on same line
================================
use ;

		Enum.reject( row, fn ( %Postgrex.Timestamp{} ) -> true; (_) -> false end )

like so

		iex(40)> row
		["3612520226043.BNB", "3612520226043", "BNB",
		%Postgrex.Timestamp{day: 15, hour: 2, min: 0, month: 10, sec: 0, usec: 0,
			year: 2014}, 1, "Court f", "short", nil, "ROSE",
		"1216015 short basic toile loose ROSE 38", "SODISHOF ROSE 38", "default",
		34.99, "PE14", "38", "pantalon F", "117043", nil, "1216015.89.BNB",
		%Postgrex.Timestamp{day: 17, hour: 19, min: 6, month: 4, sec: 58, usec: 678000,
			year: 2014},
		%Postgrex.Timestamp{day: 13, hour: 17, min: 12, month: 5, sec: 15,
			usec: 725000, year: 2015}]
		iex(41)> Enum.reject( row, fn ( %Postgrex.Timestamp{} ) -> true; (_) -> false end )
		["3612520226043.BNB", "3612520226043", "BNB", 1, "Court f", "short", nil,
		"ROSE", "1216015 short basic toile loose ROSE 38", "SODISHOF ROSE 38",
		"default", 34.99, "PE14", "38", "pantalon F", "117043", nil, "1216015.89.BNB"]
