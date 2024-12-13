SELECT TOP 2 * FROM constituencywise_details
SELECT TOP 2 * FROM constituencywise_results
SELECT TOP 2 * FROM partywise_results
SELECT TOP 2 * FROM statewise_results
SELECT TOP 2 * FROM states_

--QUES 1: TOTAL SEATS

SELECT COUNT( DISTINCT A.Parliament_Constituency) AS TOTAL_SEATS FROM constituencywise_results AS A

--WHAT ARE THE TOTAL NUMBER OF SEATS AVAILABLE FOR ELECTIONS IN EACH STATE 

SELECT A.State, COUNT(DISTINCT A.Parliament_Constituency) AS TOTAL_SEATS FROM statewise_results AS A
GROUP BY A.State

--QUES 2: TOTAL SEATS WON BY NDA ALLIANCE

SELECT 
      SUM(CASE
	          WHEN party IN(
			      'Bharatiya Janata Party - BJP',
				  'Telugu Desam - TDP',
				  'Janata Dal  (United) - JD(U)',
				  'Shiv Sena - SHS',
				  'AJSU Party - AJSUP',
				  'Apna Dal (Soneylal) - ADAL',
				  'Asom Gana Parishad - AGP',
				  'Hindustani Awam Morcha (Secular) - HAMS',
				  'Janasena Party - JnP',
				  'Janata Dal  (Secular) - JD(S)',
				  'Lok Janshakti Party(Ram Vilas) - LJPRV',
				  'Nationalist Congress Party - NCP',
				  'Rashtriya Lok Dal - RLD',
				  'Sikkim Krantikari Morcha - SKM'
				  ) THEN [WON]
				  ELSE 0
				  END) AS NDA_TOTAL_SEATS_WON

FROM 
     partywise_results 

--QUES 3: SEATS WON BY NDA ALLIANCE PARTIES 

SELECT A.Party,A.Won FROM partywise_results AS A
WHERE A.Party IN ( 'Bharatiya Janata Party - BJP',
				  'Telugu Desam - TDP',
				  'Janata Dal  (United) - JD(U)',
				  'Shiv Sena - SHS',
				  'AJSU Party - AJSUP',
				  'Apna Dal (Soneylal) - ADAL',
				  'Asom Gana Parishad - AGP',
				  'Hindustani Awam Morcha (Secular) - HAMS',
				  'Janasena Party - JnP',
				  'Janata Dal  (Secular) - JD(S)',
				  'Lok Janshakti Party(Ram Vilas) - LJPRV',
				  'Nationalist Congress Party - NCP',
				  'Rashtriya Lok Dal - RLD',
				  'Sikkim Krantikari Morcha - SKM')
ORDER BY A.Won DESC

--QUES 4: TOTAL SEATS WON BY I.N.D.I.A ALLIANCE

SELECT 
    SUM(CASE 
            WHEN party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            ) THEN [Won]
            ELSE 0 
        END) AS INDIA_Total_Seats_Won
FROM 
    partywise_results

--QUES 5: SEATS WON BY I.N.D.I.A ALLIANCE PARTIES 

SELECT 
    party as Party_Name,
    won as Seats_Won
FROM 
    partywise_results
WHERE 
    party IN (
        'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
    )
ORDER BY Seats_Won DESC

--QUES 6: Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

SELECT * FROM partywise_results

ALTER TABLE partywise_results
ADD party_alliance VARCHAR(50)

--I.N.D.I.A ALLIANCE

UPDATE partywise_results
SET party_alliance = 'I.N.D.I.A'
WHERE party IN (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
)

--NDA Allianz

UPDATE partywise_results
SET party_alliance = 'NDA'
WHERE party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
)

--OTHER

UPDATE partywise_results
SET party_alliance = 'OTHER'
WHERE party_alliance IS NULL

--QUES 7: Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?

SELECT TOP 1 A.PARTY_ALLIANCE,SUM(A.Won) AS TOTAL_SEATS_WON FROM partywise_results AS A
GROUP BY A.PARTY_ALLIANCE
ORDER BY TOTAL_SEATS_WON DESC

--QUES 8: Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?

SELECT A.Winning_Candidate,B.Party,A.Total_Votes,A.Margin,D.STATE,A.Constituency_Name,B.PARTY_ALLIANCE FROM constituencywise_results AS A
INNER JOIN partywise_results AS B
ON A.Party_ID = B.Party_ID
INNER JOIN statewise_results AS C
ON A.Parliament_Constituency = C.Parliament_Constituency
INNER JOIN STATES_ AS D
ON C.State_ID = D.STATE_ID
WHERE D.STATE = 'UTTAR PRADESH' AND A.Constituency_Name = 'AMETHI'

--QUES 9: What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?

SELECT A.Candidate,A.EVM_Votes,A.Postal_Votes,A.Total_Votes,A.Party,B.Constituency_Name FROM constituencywise_details AS A
INNER JOIN constituencywise_results AS B
ON A.Constituency_ID = B.Constituency_ID
WHERE B.Constituency_Name = 'ADILABAD'
ORDER BY A.Total_Votes DESC

--QUES 10: Which parties won the most seats in specific State, and how many seats did each party win?

SELECT B.Party,COUNT(A.Constituency_ID) AS TOTAL_SEATS FROM constituencywise_results  AS A
INNER JOIN partywise_results AS B
ON A.Party_ID = B.Party_ID
INNER JOIN statewise_results AS C
ON A.Parliament_Constituency = C.Parliament_Constituency
WHERE C.State = 'UTTAR PRADESH'
GROUP BY B.Party
ORDER BY TOTAL_SEATS DESC

--QUES 11: What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024

SELECT 
    C.State AS State_Name,
    SUM(CASE WHEN B.party_alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
    SUM(CASE WHEN B.party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
	SUM(CASE WHEN B.party_alliance = 'OTHER' THEN 1 ELSE 0 END) AS OTHER_Seats_Won
FROM 
    constituencywise_results AS A
INNER JOIN 
    partywise_results AS B
	ON A.Party_ID = B.Party_ID
INNER JOIN 
    statewise_results AS C
	ON A.Parliament_Constituency = C.Parliament_Constituency
WHERE 
    B.party_alliance IN ('NDA', 'I.N.D.I.A',  'OTHER')  -- Filter for NDA and INDIA alliances
GROUP BY 
    C.State
ORDER BY 
    C.State

-- QUES 12: For the state of Maharashtra, what are the total number of seats, total number of candidates, 
--Total number of parties, total votes (including EVM and postal), and the breakdown of EVM and postal votes?

SELECT 
    COUNT(DISTINCT A.Constituency_ID) AS Total_Seats,
    COUNT(DISTINCT B.Candidate) AS Total_Candidates,
    COUNT(DISTINCT D.Party) AS Total_Parties,
    SUM(B.EVM_Votes + B.Postal_Votes) AS Total_Votes,
    SUM(B.EVM_Votes) AS Total_EVM_Votes,
    SUM(B.Postal_Votes) AS Total_Postal_Votes
FROM constituencywise_results AS A
INNER JOIN constituencywise_details AS B
ON A.Constituency_ID = B.Constituency_ID
INNER JOIN statewise_results AS C
ON A.Parliament_Constituency = C.Parliament_Constituency
INNER JOIN partywise_results AS D
ON A.Party_ID = D.Party_ID
WHERE C.State = 'Maharashtra'































