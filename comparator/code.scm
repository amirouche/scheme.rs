;;
;; Helpers

(define procedure->javascript callback)

(define pk
  (lambda args
    (for-each print args)
    (car (reverse args))))

(define (ref alist symbol)
  (let loop ((alist alist))
    (if (null? alist)
        #f
        (if (eq? symbol (caar alist))
            (cdar alist)
            (loop (cdr alist))))))

(pk "Hello schemers!")

;; Bindings

(define v* vector)

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
          (cons (cons key alist) out)
          (let ((tuple (car tuples)))
            (if (eq? key (car tuple))
                (loop (cdr tuples) key (cons (apply cons (cdr tuple)) alist) out)
                (let ((new-key (car tuple)))
                  (loop (cdr tuples) new-key '() (cons (cons key alist) out)))))))))

(define hyperdata-by-key (hyperdata-group-by-key hyperdata))

(for-each pk hyperdata-by-key)

(define (filter predicate? objects)
  (let loop ((objects objects)
             (out '()))
    (if (null? objects)
        out
        (if (predicate? (car objects))
            (loop (cdr objects) (cons (car objects) out))
            (loop (cdr objects) out)))))

(define hyperdata-filters (list->vector (map car (filter (lambda (x) (eq? 'filter (list-ref x 2))) hyperdata))))

(define hyperdata-schemes (map car (filter (lambda (x) (eq? 'scheme (list-ref x 2))) hyperdata)))

(define component-filter-toggle
  (lambda (active symbol)
    (let loop ((active active)
               (out '()))
      (if (null? active)
          (cons symbol out)
          (if (eq? symbol (car active))
              (append (cdr active) out)
              (loop (cdr active) (cons (car active) out)))))))

(define (component-filter mc symbol active)
  (let* ((alist (ref hyperdata-by-key symbol))
         (name (ref alist 'name))
         (class (if (null? (filter (lambda (x) (eq? symbol x)) active)) "" "active")))
    (h* "button" (% "class" class
                    "onClick" (mc (lambda (model) (component-filter-toggle model symbol))))
        name)))

(define every?
  (lambda (predicate? objects)
    (let loop ((objects objects))
      (if (null? objects)
          #t
          (if (predicate? (car objects))
              (loop (cdr objects))
              #f)))))

(define match?
  (lambda (scheme filters)
    (let ((scheme (ref hyperdata-by-key scheme)))
      (if (every? (lambda (x) (ref scheme x)) filters)
          #t
          #f))))

(define component-scheme
  (lambda (scheme)
    (pk scheme)
    (let ((scheme (pk "data " (ref hyperdata-by-key scheme))))
      (h* "div" (% "class" "scheme")
          (h* "a" (% "target" "_blank"
                     "href" (ref scheme 'forge))
              (v* (h* "b" (%) (ref scheme 'name))
                  " - "
                  (ref scheme 'description)))))))

(define (view model mc)
  (v*
   (h* "h1" (%) "Mighty Scheme implementations")
   (map (lambda (x) (component-filter mc x model)) hyperdata-filters)
   (h* "hr" (%) "")
   (map component-scheme (pk (list->vector (filter (lambda (x) (match? x model)) hyperdata-schemes))))))


(create-app (lambda () '()) view)
