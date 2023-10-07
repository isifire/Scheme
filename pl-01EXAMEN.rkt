(require mzlib/compat racket/function)

;;; Ejercicio 1
;;; -----------





;(display "sort?((-3 0 2.9 10), <): ")
;(sort? '(-3 0 2.9 10) <)  ;=> #t
;(displayln "")

;;; Ejercicio 2
;;; -----------





;(display "applyr(append, ((a) (b (c)) (d b) ((a))): ")
;(applyr append '((a) (b (c)) (d b) ((a)))) ;=> ((a) d b b (c) a)
;(displayln "")

;;; Ejercicio 3
;;; -----------
(define (map-args f a . restoArgs)
  (if (null? restoArgs) a
      (if (null? a) '(0)
              (map (lambda (x) (f a x)) restoArgs))))


;(define (map-args f a . restoArgs)
  ;(map (lambda (x) (f a x)) restoArgs))


;coge cada uno de los elementos de restoArgs y le aplica la función f
;(lambda (x) --> x representa cada sublista pasada de listaArgs, para coger cada argumento tenemos que hacer un map

(display "map-args(cons, (a), (b c), ((d))): ")
(map-args cons '(a) '(b c) '((d))) ;=> (((a) b c) ((a) (d)))
(display "map-args(+, 2, -10 , 8.5, 0): ")
(map-args + 2 -10 8.5 0)           ;=> (-8 10.5 2)
(display "map-args(+ 2): ")
(map-args + 2)                     ;=> (2)
(display "map-args(+): ")
;(map-args +)                       ;=> (0)

;;; Ejercicio 4
;;; -----------
;;; El símbolo %usoInternet-16a74 es una lista de datos de las comunidades autónomas que muestra
;;; la proporción de personas (de 16 a 74 años )que utilizan Internet en cada comunidad entre los
;;; años 2021 y 2015
;;;			                    Porcentajes de uso de Internet
;;; Comunidad autónoma		2021	2020	2019	2018	2017	2016	2015
(define %usoInternet-16a74
  '((Andalucía            	92.8	92.4	89.4	84.8	83.9	78.8	74.1)
    (Aragón               	94.8	94.2	91.8	89.2	89.8	83.9	79.8)
    (Asturias             	92.6	91.1	89.2	85.7	82.3	76.7	78.3)
    (Illes_Balears        	95.1	94.3	94.1	89.8	88.5	81.7	82.6)
    (Canarias             	93.3	91.6	89.7	84.6	83.5	78.7	75.7)
    (Cantabria            	92.5	91.7	89.1	82.3	82.7	80.1	78.8)
    (Castilla-La_Mancha   	92.7	92.7	87.2	80.5	78.3	78.0	74.3)
    (Castilla-León        	92.1	90.7	88.6	82.5	81.3	77.0	77.6)
    (Cataluña             	95.5	95.7	93.7	88.0	85.7	82.8	83.1)
    (Ceuta                	94.0	95.3	94.9	85.9	81.4	74.7	82.9)
    (Comunitat_Valenciana 	94.8	93.1	89.7	86.3	84.0	78.4	77.1)
    (Extremadura          	90.9	91.6	88.6	82.5	80.2	75.7	72.6)
    (Galicia              	90.2	87.4	84.0	80.4	79.4	74.6	71.9)
    (Comunidad_de_Madrid  	95.9	96.0	94.1	91.0	90.0	86.9	85.9)
    (Melilla              	97.4	96.7	87.6	88.8	88.0	79.4	74.3)
    (Región_Murcia        	94.8	90.6	89.8	85.7	84.5	79.1	78.0)
    (Navarra              	93.6	95.4	95.0	88.1	86.7	81.9	79.6)
    (País_Vasco           	93.3	93.4	91.5	86.3	85.7	84.8	81.5)
    (La_Rioja             	92.5	92.7	89.6	82.8	82.0	80.1	78.7)))

(displayln "%usoInternet-16a74: ")
%usoInternet-16a74
(displayln "")



;;; Apartado a
;;; ----------
;cada x de lambda es una línea de la base de datos
;tenemos que ir por cada línea y coger el cadr (2021) y ver si supera o igual 95

(displayln "%usoInternet>=95: ")
;%usoEn2021>=95
(filter (lambda (x) (>= (cadr x) 95)) %usoInternet-16a74)
(displayln "")

;;; Apartado b
;;; ----------
(define (%usoMedio comunidad)
  (cons (car comunidad) (/ (apply + (cdr comunidad)) (length (cdr comunidad)))))

(display "%usoMedio(car(%usoInternet-16a74)): ")
(%usoMedio (car %usoInternet-16a74))    ;=> (Andalucía 85.17142857142858)
(display "%usoMedio(caddr(%usoInternet-16a74)): ")
(%usoMedio (caddr %usoInternet-16a74)) ;=> (Asturias 85.12857142857142)
(displayln "")

;;; Apartado c
;;; -----------

(displayln "%usoMedio15-21: ")
((lambda (x) (%usoMedio (car x))) %usoInternet-16a74)

;%usoMedio15-21   ;=> ((Andalucía 85.17142857142858) (Aragón 89.07142857142857) (Asturias 85.12857142857142) ...)
;(displayln "")

