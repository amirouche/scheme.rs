;;
;; Helpers

(define procedure->javascript callback)

(define pk
  (lambda args
    (apply print args)
    (car (reverse args))))

(pk "Hello schemers!")

;; Bindings

(define h*
  (lambda (tag attributes children)
    (%inline "preact.h" tag attributes children)))

(define document-get-element-by-id
  (lambda (selector)
    (%inline "document.getElementById" selector)))

(define render*
  (let ((container (document-get-element-by-id "container")))
    (lambda (app)
      (%inline "preact.render" app container))))

;; create-app, that with the bindings makes the whole framework
;;; TODO: it is missing xhr and websockets...

(define (create-app init view)
  (let ((model (init)))
    (letrec ((make-controller (lambda (proc) (procedure->javascript
                                              (lambda args
                                                (set! model (apply proc model args))
                                                (render* (view model make-controller)))))))
      (render* (view model make-controller)))))

;;

(define hyperdata-group-by-key
  (lambda (tuples)
    (let loop ((tuples tuples)
               (key (caar tuples))
               (alist '())
               (out '()))
      (if (null? tuples)
          out
          (let ((tuple (car tuples)))
            (if (eq? key (car tuple))
                (loop (cdr tuples) key (cons (apply cons (cdr tuple)) alist) out)
                (let ((key* (car tuple)))
                  (loop (cdr tuples) key* '() (cons (cons key* alist) out)))))))))

(define keys (hyperdata-group-by-key hyperdata))

;; (for-each pk keys)
;; (render* (h* "p" (%) (vector (h* "em" (%) "coucou") " les schemers")))


(define (view model mc)
  (h* "button" (% "onClick" (mc (lambda (model . args) (+ 1 model)))) model))


(create-app (lambda () 0) view)
