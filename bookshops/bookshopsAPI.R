encontrar<-function(lugar,radius){
        
        # radius in meters
        # lugar is coordinates from google maps by hand
        coor<-paste(lugar[1],lugar[2],sep=",")
        baseurl<-"https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
        google_key<-c("AIzaSyCJyEHM8rX1VbKgQFebC22ySExKSiYQ3v4")
        
        
        q<-paste(baseurl,"location=",coor,"&radius=",radius,"&types=book_store","&key=",google_key, sep="")
        
        data<-fromJSON(file = q)
        
}

coordenadas<-c(51.510618, -0.130086)

bookshops <- encontrar(lugar = coordenadas,radius = 500)

tidy_bookshops <- bookshops %>% flatten %>% as.tbl_json %>% slice(-c(1,22)) %>% spread_all() 

tidy_bookshops %>% saveRDS(file = "tidyBookshops.rds")