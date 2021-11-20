;; This is the beginning...
(define hyperdata '(
;; hyper data, or metadata renaissance

;;; Supported standards

(standards type section)
(standards name "Supported standards")

(r5rs type filter)
(r5rs subtype standards)
(r5rs name "R5RS")

(r6rs type filter)
(r6rs subtype standards)
(r6rs name "R6RS")

(r7rs-small type filter)
(r7rs-small subtype standards)
(r7rs-small name "R7RS-small")

(r7rs-large type filter)
(r7rs-large subtype standards)
(r7rs-large name "R7RS-large")

;;; Package manager
(package-manager type section)
(package-manager name "Package manager")

(debian type filter)
(debian subtype package-manager)
(debian name "Debian")

(fedora type filter)
(fedora subtype package-manager)
(fedora name "Fedora")

(guix type filter)
(guix subtype package-manager)
(guix name "GNU Guix")

;;; Foreign Function Interface

(ffi type section)
(ffi name "Foreign Function Interface")

(cffi type filter)
(cffi subtype ffi)
(cffi name "C FFI")

(cppffi type filter)
(cppffi subtype ffi)
(cppffi name "C++ FFI")

(javaffi type filter)
(javaffi subtype ffi)
(javaffi name "Java FFI")

(.netffi type filter)
(.netffi subtype ffi)
(.netffi name ".Net FFI")

(javascriptffi type filter)
(javascriptffi subtype ffi)
(javascriptffi name "JavaScript FFI")

;;; WebDev

(webdev type section)
(webdev name "Web Development")

(http-client type filter)
(http-client subtype webdev)
(http-client name "HTTP Client with TLS support")

(database type filter)
(database subtype webdev)
(database name "Database drivers")

(deployment type filter)
(deployment subtype webdev)
(deployment name "Deployment tools")

(http-server type filter)
(http-server subtype webdev)
(http-server name "HTTP Server")

(websocket type filter)
(websocket subtype webdev)
(websocket name "WebSocket")

;;; Documentation

(documentation type section)
(documentation name "Documentation")

(so1k type filter)
(so1k subtype documentation)
(so1k name "1k+ tagged questions on StackOverflow")

(doc50k type filter)
(doc50k subtype documentation)
(doc50k name "50k+ words of documentation")

(pubs type filter)
(pubs subtype documentation)
(pubs name "10+ publications")

;;; Operating System

(os type section)
(os name "Operating System")

(windows type filter)
(windows subtype os)
(windows name "Windows")

(macos type filter)
(macos subtype os)
(macos name "macOS")

(gnu/linux type filter)
(gnu/linux subtype os)
(gnu/linux name "GNU/Linux")

(freebsd type filter)
(freebsd subtype os)
(freebsd name "FreeBSD")

(netbsd type filter)
(netbsd subtype os)
(netbsd name "NetBSD")

(openbsd type filter)
(openbsd subtype os)
(openbsd name "OpenBSD")

(android type filter)
(android subtype os)
(android name "Android")

(iOS type filter)
(iOS subtype os)
(iOS name "IOS")

;;; Hardware architecture

(hardware type section)
(hardware name "Hardware architecture")

(amd64 type filter)
(amd64 subtype hardware)
(amd64 name "AMD64")

(x86 type filter)
(x86 subtype hardware)
(x86 name "x86")

(aarch64 type filter)
(aarch64 subtype hardware)
(aarch64 name "aarch64")

(m1 type filter)
(m1 subtype hardware)
(m1 name "Apple M1")

(microtrollers type filter)
(microtrollers subtype hardware)
(microtrollers name "microcontrollers")

;;; Other

(other type section)
(other name "Other")

(oop type filter)
(oop subtype other)
(oop name "Object-Oriented Programming")

(toy type filter)
(toy subtype other)
(toy name "Toy")

(top3 type filter)
(top3 subtype other)
(top3 name "Top 3 ecraven's benchmarks")

(mbe type filter)
(mbe subtype other)
(mbe name "Create create binary executables")

(embedding type filter)
(embedding subtype other)
(embedding name "Can be embedded in another program")

(wos type filter)
(wos subtype other)
(wos name "Whole-stack Scheme operating system")
;; Chez Scheme

(chez type scheme)
(chez name "Chez Scheme")
(chez url "https://scheme.com/")
(chez forge "https://github.com/cisco/chezscheme")
(chez description "both a programming language and an implementation of that language, with supporting tools and documentation. As a superset of the language described in the Revised 6 Report on the Algorithmic Language Scheme (R6RS), Chez Scheme supports all standard features of Scheme, including first-class procedures, proper treatment of tail calls, continuations, user-defined records, libraries, exceptions, and hygienic macro expansion. Chez Scheme also includes extensive support for interfacing with C and other languages, support for multiple threads possibly running on multiple cores, non-blocking I/O, and many other features.")
(chez r6rs #t)
;; This is the end... of the symbolic expression started in
;; 00-hyperdata called hyperdata.
))
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
