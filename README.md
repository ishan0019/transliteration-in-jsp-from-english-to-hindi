transliteration-in-jsp-from-english-to-hindi
============================================
--It is one part of search engine which takes up input string .
--String is refined for any unwanted symbols or characters which may cause security issues in future.
--Then string is divided into words where words are first directly search in db.
--If nothing corresponding to it is found then system performs transliteration of english word to corresponding hindi word.
-- Then mata string produced is search for relevant or most similar words and output which matches more than 95% to the 
   meta string and its link to corresponding page is stored in high to low priority.
--String matching is performed through LCS (longest common subsequence ) Algorithm. 
--Output is then shown to user.
