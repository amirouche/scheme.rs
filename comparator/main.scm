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

(ios type filter)
(ios subtype os)
(ios name "IOS")

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
(chez description "supports all standard features of Scheme, including first-class procedures, proper treatment of tail calls, continuations, user-defined records, libraries, exceptions, and hygienic macro expansion. Chez Scheme also includes extensive support for interfacing with C and other languages, support for multiple threads possibly running on multiple cores, non-blocking I/O, and many other features.")
(chez r6rs #t)
(chez debian #t)
(chez guix #t)
(chez cffi #t)
(chez database #t)
(chez doc50k #t)
(chez pubs #t)
(chez windows #t)
(chez gnu/linux #t)
(chez amd64 #t)
(chez x86 #t)
(chez top3 #t)
;; Gambit Scheme

(gambit type scheme)
(gambit name "Gambit Scheme")
(gambit url "http://gambitscheme.org"/ga)
(gambit forge "https://github.com/gambit/gambit/")
(gambit description "a complete, portable, efficient and reliable implementation of the Scheme programming language.")
(gambit r5rs #t)
(gambit r7rs-small #t)
(gambit debian #t)
(gambit cffi #t)
(gambit cppffi #t)
(gambit javascriptffi #t)
(gambit doc50k #t)
(gambit pubs #t)
(gambit windows #t)
(gambit gnu/linux #t)
(gambit android #t)
(gambit ios #t)
(gambit amd64 #t)
(gambit x86 #t)
;; Gerbil Scheme

(gerbil type scheme)
(gerbil name "Gerbil Scheme")
(gerbil url "https://cons.io/")
(gerbil forge "https://github.com/vyzo/gerbil")
(gerbil description "meta-dialect of Scheme with post-modern features. Gerbil is an opinionated dialect of Scheme designed for Systems Programming, with a state of the art macro and module system on top of the Gambit runtime.")
(gerbil r7rs-small #t)
(gerbil r7rs-large #t)
(gerbil cffi #t)
(gerbil cppffi #t)
(gerbil http-client #t)
(gerbil http-server #t)
(gerbil doc50k #t)
(gerbil windows #t)
(gerbil macos #t)
(gerbil gnu/linux #t)
(gerbil amd64 #t)
(gerbil x86 #t)
(gerbil top3 #t)
;; Racket

(racket type scheme)
(racket name "Racket")
(racket url "https://racket-lang.org/")
(racket forge "https://github.com/racket/racket")
(racket description "Racket is a general-purpose programming language and an ecosystem for language-oriented programming.")
(racket r6rs #t)
(racket r7rs-small #t)
(racket debian #t)
(racket guix #t)
(racket cffi #t)
(racket http-client #t)
(racket http-server #t)
(racket doc50k #t)
(racket pubs #t)
(racket windows #t)
(racket macos #t)
(racket gnu/linux #t)
(racket amd64 #t)
(racket top3 #t)
;; Bigloooooooooooooooooooooooooooop

(bigloo type scheme)
(bigloo name "Bigloo Scheme")
(bigloo url "https://www-sop.inria.fr/mimosa/fp/Bigloo/")
(bigloo froge "https://github.com/manuel-serrano/bigloo")
(bigloo description "Bigloo is a Scheme development environment that includes a compiler generating C code and Java classes, and an interpreter. Bigloo is the tool of choice for building autonomous applications in Scheme. It is mostly conformant to the Revised5 Report on the Algorithmic Language Scheme with many extensions.")
(bigloo r5rs #t)
(bigloo guix #t)
(bigloo cffi #t)
(bigloo javaffi #t)
(bigloo pubs #t)
(bigloo gnu/linux #t)
(bigloo amd64 #t)
(bigloo x86 #t)
(bigloo oop #t)
;; Implementation mit

(mit type scheme)
(mit name "MIT")
(mit url "https://www.gnu.org/software/mit-scheme/")
(mit forge "https://www.gnu.org/software/mit-scheme/")
(mit description "MIT/GNU Scheme is an implementation of the Scheme programming language, providing an interpreter, compiler, source-code debugger, integrated Emacs-like editor, and a large runtime library. MIT/GNU Scheme is best suited to programming large applications with a rapid development cycle.")
(mit r5rs #t)
(mit debian #t)
(mit guix #t)
(mit cffi #t)
(mit cffi #t)
(mit doc50k #t)
(mit windows #t)
(mit macos #t)
(mit gnu/linux #t)
(mit amd64 #t)
(mit x86 #t)
(mit aarch64 #t)
(mit database #t)
;; Implementation guile

(guile type scheme)
(guile name "Guile")
(guile url "https://www.gnu.org/software/guile/")
(guile forge "https://www.gnu.org/software/guile/")
(guile description "designed to help programmers create flexible applications that can be extended by users or other programmers with plug-ins, modules, or scripts. With Guile you can create applications and games for the desktop, the Web, the command-line, and more.")
(guile r6rs #t)
(guile r7rs-small #t)
(guile debian #t)
(guile fedora #t)
(guile guix #t)
(guile cffi #t)
(guile http-client #t)
(guile database #t)
(guile deployment #t)
(guile https-server #t)
(guile https-server #t)
(guile doc50k #t)
(guile windows #t)
(guile gnu/linux #t)
(guile amd64 #t)
(guile oop #t)
(guile embedding #t)
;; Implementation loko

(loko type scheme)
(loko name "Loko Scheme")
(loko url "https://scheme.fail/")
(loko forge "https://gitlab.com/weinholt/loko")
(loko description "An optimizing Scheme compiler. Batteries on the side (Akku.scm). Cross-compiles to Linux/amd64, NetBSD/amd64 and bare metal amd64. Speaks R6RS Scheme natively and R7RS Scheme as a second language. Concurrency based on Concurrent ML. Compiled code with reasonable performance.")
(loko r6rs #t)
(loko r7rs-small #t)
(loko gnu/linux #t)
(loko netbsd #t)
(loko amd64 #t)
(loko wos #t)
;; Implementation cyclone

(cyclone type scheme)
(cyclone name "Cyclone Scheme")
(cyclone url "http://justinethier.github.io/cyclone/")
(cyclone forge "https://github.com/justinethier/cyclone")
(cyclone description "A brand-new compiler that allows practical application development using R7RS Scheme. We provide modern features and a stable system capable of generating fast native binaries. ")
(cyclone r7rs-small #t)
(cyclone cffi #t)
(cyclone windows #t)
(cyclone macos #t)
(cyclone windows #t)
(cyclone gnu/linux #t)
(cyclone amd64 #t)
;; Implementation name

(bones type scheme)
(bones name "Bones Scheme")
(bones url "http://www.call-with-current-continuation.org/bones/")
(bones forge "http://www.call-with-current-continuation.org/bones/")
(bones description "This is BONES, a compiler for R5RS Scheme that generates x86_64 assembly code. BONES is designed to be simple and easy to understand, both to reduce the effort to learn and extend the system and to keep the complexity of the compiler at a minimum.")
(bones toy #t)
;; Implementation chicken

(chicken type scheme)
(chicken name "Chicken Scheme")
(chicken url "http://call-cc.org/")
(chicken forge "http://call-cc.org/")
(chicken description "CHICKEN is a compiler for the Scheme programming language. It produces portable and efficient C and supports the R5RS and R7RS (work in progress) standards, and many extensions. It runs on Linux, OS X, Windows, many Unix flavours, and aims to be...")
(chicken r7rs-small #t)
(chicken debian #t)
(chicken guix #t)
(chicken cffi #t)
(chicken cppffi #t)
(chicken http-client #t)
(chicken database #t)
(chicken websocket #t)
(chicken http-server #t)
(chicken doc50k #t)
(chicken macos #t)
(chicken gnu/linux #t)
;; Implementation s7

(s7 type scheme)
(s7 name "S7 Scheme")
(s7 url "https://ccrma.stanford.edu/software/snd/snd/s7.html")
(s7 forge "https://github.com/actonDev/s7-playground/")
(s7 description "s7 is a Scheme implementation intended as an extension language for other applications, primarily Snd, Radium, Common Music, and Max/MSP through the Scheme For Max external. It exists as just two files, s7.c and s7.h, that want only to disappear into someone else's source tree. There are no libraries, no run-time init files, and no configuration scripts. It can be built as a stand-alone interpreter")
(s7 cffi #t)
(s7 cppffi #t)
(s7 doc50k #t)
(s7 embedding #t)
;; Implementation gauche

(gauche type scheme)
(gauche name "Gauche Scheme")
(gauche url "https://practical-scheme.net/")
(gauche forge "https://github.com/shirok/Gauche")
(gauche description "Gauche is an R7RS Scheme scripting engine aiming at being a handy tool that helps programmers and system administrators to write small to large scripts quickly.")
(gauche r7rs-small #t)
(gauche r7rs-large #t)
(gauche cffi #t)
(gauche debian #t)
(gauche gnu/linux #t)
;; Implementation kawa

(kawa type scheme)
(kawa name "Kawa Scheme")
(kawa url "https://www.gnu.org/software/kawa/")
(kawa forge "https://www.gnu.org/software/kawa/")
(kawa description "Kawa is a general-purpose programming language that runs on the Java platform. It aims to combine: a) the benefits of dynamic scripting languages (non-verbose code with less boiler-plate, fast and easy start-up, a REPL, no required compilation step); with b)the benefits of traditional compiled languages (fast execution, static error detection, modularity, zero-overhead Java platform integration). It is an extension of the long-established Scheme language, which is in the Lisp family of programming languages. Kawa has many useful features. Kawa is also a useful framework for implementing other programming languages on the Java platform. It has many useful utility classes.")
(kawa javaffi #t)
;; Scheme 9 from Empty Space, Reimagined

(s9fes type scheme)
(s9fes name "Scheme 9 from Empty Space, Reimagined")
(s9fes url "https://t3x.org/s9fes/")
(s9fes forge "https://t3x.org/s9fes/")
(s9fes description "S9fES is a mature, portable, and comprehensible interpreter for R4RS Scheme. The core interpreter is written in pure ANSI C (C89), so it runs on all platforms offering a C compiler. It can even be compiled natively on Plan 9. On Unix-based systems (or MinGW), it also offers an interface to common Unix system calls and Curses routines. S9fES Reimagined is a new version of the S9 interpreter in which wide parts of the system have been rewritten.")
(s9fes doc50k #t)
(s9fes gnu/linux #t)
(s9fes freebsd #t)
(s9fes openbsd #t)
(s9fes netbsd #t)
(s9fes amd64 #t)
(s9fes toy #t)
;; STklos

(stklos type scheme)
(stklos name "STklos Scheme")
(stklos url "https://stklos.net")
(stklos forge "https://github.com/egallesio/stklos")
(stklos description "STklos is a free Scheme system mostly compliant with the languages features defined in R7RS small. The aim of this implementation is to be fast as well as light. The implementation is based on an ad-hoc Virtual Machine.")
(stklos r5rs #t)
(stklos r7rs-small #t)
(stklos cffi #t)
(stklos doc50k #t)
(stklos freebsd #t)
(stklos android #t)
(stklos gnu/linux #t)
(stklos amd64 #t)
(stklos x86 #t)
(stklos oop #t)
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
