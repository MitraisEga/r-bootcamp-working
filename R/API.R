library("plumber")
library("Rook")
library("dplyr")

#' Show Hello World message
#' @get /hello
hello <- function(){
  c("hello world")
}

#' read votes file and return the total vote type on every post
#' @param req uploaded file votes.csv based on stackexchange data
#' @post /uploadVotes
fileUpload <- function(req){
  formContents <- Rook::Multipart$parse(req)
  uploaded_loc <- formContents$req$tempfile
  filedata<-read.csv(file= uploaded_loc,sep=',',header = TRUE)
  
  #convert to df table
  filedataset<-tbl_df(filedata)
  result<- filedataset %>% select("post_id","vote_type_id") %>% group_by(post_id,vote_type_id) %>% summarise(total_vote=n())
  
  return(result)
  
}

#' try to return result
#' @param req the posted votes.csv from stackexchange data
#' @png return the data as png
#' @post /readPostScore
getResult<- function(req){
  formContents <- Rook::Multipart$parse(req)
  uploaded_loc <- formContents$req$tempfile
  filedata<-read.csv(file= uploaded_loc,sep=',',header = TRUE)
  
  filedataset<-tbl_df(filedata)
  result<- filedataset %>% select("post_id","vote_type_id") %>% group_by(post_id,vote_type_id) %>% summarise(total_vote=n())
  
  post_score <- result %>% mutate(score= vote_type_id * total_vote) %>% select(post_id,score) %>% group_by(post_id) %>% summarise(score= sum(score))
  
  barplot(post_score$score,names.arg = post_score$post_id)
}
