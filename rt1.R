rm(list=ls(all=TRUE))

myLoad <- function(...) {
  sapply(sapply(match.call(), as.character)[-1], require, character.only = TRUE)
}
myLoad(data.table,ggplot2,bit64,pdftools,xlsx,hunspell,tm,cld2,cld3)

# Use text-mining package to extract text from PDF files    

# Function to read a PDF file and turn it into a data frame
PDFtoDF = function(file) {
  ## Extract PDF text. Each line of PDF becomes one element of the string vector dat.
  dat = readPDF(control=list(text="-layout"))(elem=list(uri=file), 
                                              language="en", id="id1") 
  dat = c(as.character(dat))
  
  ## Keep only those strings that contain the data we want. 
  ## These are the ones that begin with a number.
  dat = dat[grep("^ {0,2}[0-9]{1,3}", dat)]
  
  ## Create separators so we can turn strings into a data frame. We'll use the 
  ## pipe "|" as a separator.
  ## Create separators so we can turn strings into a data frame. We'll use the 
  ## pipe "|" as a separator.
  
  # Add pipe after first number (the row number in the PDF file)
  dat = gsub("^ ?([0-9]{1,3}) ?", "\\1|", dat)
  
  # Replace each instance of 2 or more spaces in a row with a pipe separator. This 
  # works because the company names have a single space between words, while data
  # fields generally have more than one space between them. 
  # (We just need to first add an extra space in a few cases where there's only one
  # space between two data fields.)
  dat = gsub("(, HVOL )","\\1 ", dat)
  dat = gsub(" {2,100}", "|", dat)
  
  ## Check for data format problems
  # Identify rows without the right number of fields (there should 
  # be six pipe characters per row) and save them to a file for 
  # later inspection and processing (in this case row 11 of the PDF file is excluded))
  excludeRows = lapply(gregexpr("\\|", dat), function(x) length(x)) != 6
  write(dat[excludeRows], "rowsToCheck.txt", append=TRUE)
  
  # Remove the excluded rows from the string vector
  dat = dat[!excludeRows]
  ## Convert string vector to data frame 
  dat = read.table(text=dat, sep="|", quote="", stringsAsFactors=FALSE)
  names(dat) = c("RowNum", "Reference Entity", "Sub-Index", "CLIP", 
                 "Reference Obligation", "CUSIP/ISIN", "Weighting")
  return(dat)
}

# Create vector of names of files to read
files = list.files(pattern="CDX.*\\.pdf")

# Read each file, convert it to a data frame, then rbind into single data frame
df = do.call("rbind", lapply(files, PDFtoDF))

setwd("\\\\hbeu.adroot.hsbc/gb001/Redir GB Users GMO/43978667/Documents/data/roundtable")
str_data                 <- 'Westpac.pdf'
text <- pdftools::pdf_text(str_data)

bad <- hunspell("spell checkers are not neccessairy for langauge ninja's")

bad <- hunspell("spell checkers are not neccessairy for langauge ninja's")
print(bad[[1]])


# Find possible stems for each word
words <- c("loving", "loved", "lover", "lovely", "love")
hunspell_analyze(words)


# Vectorized function
text <- c("À chaque fou plaît sa marotte.??????","?????????",
          "go to home","let's go trade fishing","busy","???")
text1 <- c('i must go home now','tony','give me you hand','gone')
text2 <- c('"NEWS RELEASE  Date    16 June 2016     RBNZ Bulletin examines forecast performance     The Reserve Bank today published a Bulletin article documenting the performance  of the Bank's forecasts over the period 2009 to 2015.  The Reserve Bank published similar reviews in 2009, 2006 and 2002. Central  banks regularly review their forecast performance, often comparing their  forecasts to those prepared by other agencies and private sector firms.   The Bulletin article explains that assessing the accuracy of macroeconomic  forecasts is important for identifying opportunities to improve macroeconomic  advice.   The Bulletin article concludes that over the past five years the Reserve Bank's  inflation forecasts have outperformed other macroeconomic forecasters. The  Bank's inflation forecasts have tended to be slightly lower than the median of  the other macroeconomic forecasters and this assisted performance.   The Bank's forecasts also outperformed external forecasters' median forecast  for output growth and the interest rate, but performed relatively poorly on the  exchange rate. All forecasters consistently expected a lower exchange rate than  transpired.  The Bulletin's author - Dr Kirdan Lees - wrote the Bulletin article while at  NZIER, under a contract from the Reserve Bank. Data used in the study was  supplied by the Reserve Bank.   More information:  Reserve Bank Bulletin  Media Contact: Naomi Mitchell External Communications Adviser,  Ph 09 366 2643 or 027 294 3900 Email: naomi.mitchell@rbnz.govt.nz       ****************************************************************** This message originated from the Internet. Its originator may or may not be who they claim to be and the information contained in the message and any attachments may or may not be accurate. ******************************************************************"')
cld3::detect_language(text2)
cld3::detect_language(words)
cld3::detect_language_mixed(words)
cld3::detect_language_mixed(text)
