;;; *************
;;; * SESIÓN-02 *
;;; *************


(require mzlib/compat)         ; Importa una biblioteca. En particular, nos
                               ; permite utilizar la función atom? que, en
                               ; otro caso, no estaría disponible


;;; Definición de funciones, f(param1, param2, ...), sintaxis:
;;;
;;; (define (f param1 param2 ...) Sexp)
;;;
;;; Nombre de la función: f
;;; Parámetros de la función: param1 param2 ...    (pueden ser 0)
;;; Cuerpo de la definición: cualquier S-expresión Sexp evaluable
;;; Resultado de la llamada: la evaluación de la S-expresión que resulta
;;; de sustituir los parámetros de la función en la S-expresión Sexp por
;;; argumentos de la llamada.
;;;
;;; Ejemplos:

(define (saluda) '¡Hola_Mundo!) ; definición
(saluda)                        ; invocación (o llamada)

(define (suma a b) (+ a b))     ; definición
(suma 3 -10)                    ; invocación


;;; Definición de funciones recursivas sobre listas
;;; -----------------------------------------------
;;;
;;; En el análisis por casos se utilizará la notación funcional estándar:
;;; <nombre_función>(arg0, arg1, ...). Por ejemplo, para f(l):
;;;
;;; 1. Base       : el resultado de la función la lista vacía;
;;;                 f(()) ::= lo que corresponda según problema a resolver
;;; 2. Recurrencia: l no es la lista vacía; es decir, l=cons(car(l), cdr(l))
;;;      Hipótesis: se supone conocido f(cdr(l))=H
;;;          Tesis: obtener f(l) a partir de la hipótesis H en combinación
;;;                 con el elemento car(l) de la lista l que no forma parte
;;;                 del argumento de la hipótesis
;;;                 f(l) ::= combinar adecuadamente car(l) y H
;;;

;;;------------------------------------------------------------------------
;;; Ejemplo: Definir la función my-length(l), que retorna el número de
;;; elementos de la lista dada.
;
; 1. Base       : el resultado de la función para la lista vacía;
;                 my-length(()) ::= 0
; 2. Recurrencia: l no es la lista vacía; es decir, l = cons(car(l), cdr(l))
;      Hipótesis: se conoce my-length(cdr(l)) = H
;      Tesis    : my-length(l) ::= H + 1
;
; En Racket:

(define (my-length l)
  (if [null? l]
      0
      (+ (my-length (cdr l)) 1)))

(displayln "my-length:")
(my-length '(a (b c) d))           ; => 3
(my-length '((a b c) d (e (f g)))) ; => 3

;;;------------------------------------------------------------------------
;;; CONSTRUIR LAS SIGUIENTES FUNCIONES RECURSIVAS
;;;------------------------------------------------------------------------
;;; En todos los casos es imprescindible realizar el análisis por casos.
;;; Estableciendo la base y la recurrencia de la misma forma que se ha
;;; hecho en el ejemplo previo.
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Función my-reverse(l) que retorna una lista con los mismos elementos
; que la proporcionada, pero en orden inverso.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;



;(displayln "my-reverse:")
;(my-reverse '((b (a)) c d))   ; => (d c (b (a)))
;(my-reverse '(a (b c) d (e))) ; => ((e) d (b c) a)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Definir la función recursiva comparar(a, b) que dados dos vectores
; (listas de números de la misma longitud), retorna la lista resultado
; de comparar componente a componente ambos vectores, de la forma que
; se indica a continuación. Si a es el vector (A0 A1 … An-1) y b es
; el vector (B0 B1 … Bn-1), la lista resultado es (R0 R1 … Rn-1),
; donde cada Ri (0≤i<n) es:
;                           /
;                          |-1 si Ai<Bi
;                    Ri = <  0 si Ai=Bi
;                          | 1 si Ai>Bi
;                           \
; Nota: deberá definirse una única función
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;



;(displayln "comparar:")
;(comparar '(2.4 7 1 -4) '(3 7 -5.25 0)) ; => (-1 0 1 -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Supuesto que los elementos de una lista representan un conjunto
; (recuérdese que un conjunto no hay orden y tampoco repeticiones)
; definir la función adjoin(x, A) que retorna un nuevo conjunto
; A + {x}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;



;(displayln "adjoin:")
;(adjoin '(a) '((b c) (d))) ; => ((b c) (d) (a))
;(adjoin 0 '(5 0 7 10)) ; => (5 7 10 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Definir la función union(A, B) = A U B que retorna el conjunto
; unión de los dos dados.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;



;(displayln "union:")
;(union '((1) (2) (3)) '((2) (5))) ; => ((1) (3) (2) (5))
;(union '(a f c b) '(z a b c))     ; => (f z a b c)


;;;------------------------------------------------------------------------
;;; EJERCICIOS COMPLEMENTARIOS
;;;------------------------------------------------------------------------
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Definir la función intersection(A, B) que retorna el conjunto
; intersección de los dos proporcionados.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;



;(displayln "intersection:")
;(intersection '((1) (2) (3)) '((2) (5))) ; => ((2))
;(intersection '(a f c b) '(z a b c))     ; => (a c b)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Definir la función matching(pattern, list) para que en lugar de
; retornar un booleano según la lista concuerde o no con el patrón
; (tal y como se indica en el documento "Definición de funciones
; recursivas") retorne la parte del patrón que hace que la lista
; no concuerde
;
; Deberá cumplise:
; matching?(pattern, list) ::= null?(matching(pattern, list))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;



;(displayln "matching:")
;(matching '((a) * ? (a) *) '((a) (b c) (a) (c)))  ; => ()
;(matching '((a) * ? (a) * ? ?) '((a) (b c) (a) (c)))  ; => ()
;(matching '((a) * ^ ? (a)) '((a) (b c) (a) (c)))  ; => (^ ? (a))
;(matching '((a) * ^ (c) ? ? *) '((a) (b (c)) a (c)))  ; => (*)