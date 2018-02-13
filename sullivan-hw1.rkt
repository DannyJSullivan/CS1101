;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname sullivan-hw2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Date

(define-struct open-date (year month day))

;; open-date is (make-open-date Natural Natural Natural)
;; interpretation: an open-date is given a
;; year of opening
;; month of opening (in numerical)
;; day of opening

(define JAN (make-open-date 1 1 2016))
(define FEB (make-open-date 2 2 2016))
(define MAR (make-open-date 3 3 2016))

;; Movie

(define-struct movie (title genre rating run-time open-date revenue))

;; a Movie is (make-movie String String String Natural String Natural)
;; interpretation: a movie is given a
;; tite
;; genre
;; rating
;; run time (in minutes)
;; what year it opens
;; what month it opens
;; what day it opens
;; revenue

(define MOVIE1 (make-movie "Interstellar" "Sci-Fi" "PG-13" 140 JAN 800000000))
(define MOVIE2 (make-movie "End of Watch" "Thriller" "R" 128 FEB 100000000))
(define MOVIE3 (make-movie "Finding Nemo" "Family" "G" 105 MAR 90000000))

;; Suitable for Children

(define (suitable-for-children? some-movie)
  (cond [(equal? (movie-rating some-movie) "G") true]
        [(equal? (movie-rating some-movie) "PG") true]
        [(equal? (movie-rating some-movie) "PG-13") true]
        [(equal? (movie-rating some-movie) "R") false]
        [(equal? (movie-rating some-movie) "NC-17") false]
        [(equal? (movie-rating some-movie) "NR") false]))

;; suitable-for-children: Movie --> Boolean
;; returns true if the movie rating is G, PG, or PG-13
;; returns false if the movie rating is R, NC-17, or NR


;; Revenue Difference

(define (difference-in-receipts some-movie some-other-movie)
  (abs (- (movie-revenue some-movie) (movie-revenue some-other-movie))))

;; difference-in-receipts: Movie Movie --> Natural
;; returns the difference in the total revenue of two movies

;; Modify Rating

(define (modify-rating some-movie new-rating)
  (make-movie (movie-title some-movie) (movie-genre some-movie) new-rating
              (movie-run-time some-movie) (movie-open-date some-movie)
              (movie-revenue some-movie)))

;; modify-rating: Movie String --> Movie
;; takes a movie and a new rating to create the
;; same movie with a new rating

;; Opens Before

(define-struct some-date (year month day))

(define (opens-before? some-movie some-date)
  (cond [(< (movie-open-date some-movie) some-date) true]
        [(> (movie-open-date some-movie) some-date) false]
        [(= (movie-open-date some-movie) some-date) false]))

;; opens-before?: Movie Natural --> Boolean
;; takes a movie and a date to tell if the movie
;; will be released before the inputed date