;
;  Genetic programming (broken) demonstration
;
;  Author   : Keith Rehm
;  Date     : 05/06/2025
;    
;  Editor   : GNU Emacs 30.1 (build 1, aarch64-apple-darwin21.6.0,
;           : NS appkit-2113.65 Version 12.7.6 (Build 21H1320)) of 2025-02-24
;
;  Compiler : GNU CLISP 2.49.92 (2018-02-18)
;
;



(defmacro define-constant (name value &optional doc)
  `(defconstant ,name (if (boundp ',name) (symbol-value ',name) ,value)
     ,@(when doc (list doc))))

(define-constant pop-size 1000)

(define-constant terminal-set '(X :random-float-constant :random-integer-constant))

(defun random-float-constant ()
  (let ((r-state (make-random-state t)))
    (+ -5.0 (random 10.0 r-state))))

(defun random-integer-constant ()
  (let ((r-state (make-random-state t)))  
    (- (random 21 r-state) 10)))

;(define-constant function-set '(add subtract multiply divide expnt))
(define-constant function-set '(add subtract multiply divide))

(defun float-protect (x)
  (handler-case (float  x)
                (floating-point-invalid-operation () 0.0)
		(floating-point-underflow () 0.0)		
		(floating-point-overflow () 1.0)))


(defun add (x y)
  (handler-case (+ (float-protect x) (float-protect y))
                (floating-point-invalid-operation () 0.0)
		(floating-point-underflow () 0.0)		
		(floating-point-overflow () 1.0)))

(defun subtract (x y)
  (handler-case (- (float-protect x) (float-protect y))
                (floating-point-invalid-operation () 0.0)
		(floating-point-underflow () 0.0)		
		(floating-point-overflow () 1.0)))

(defun multiply (x y)
  (handler-case (* (float-protect x) (float-protect y))
                (floating-point-invalid-operation () 1.0)
		(floating-point-underflow () 0.0)		
		(floating-point-overflow () 1.0)))

(defun divide (num denom)
  (handler-case (/ (float-protect num) (float-protect denom))
                (floating-point-invalid-operation () 1.0)
		(floating-point-underflow () 0.0)
		(floating-point-overflow () 1.0)
		(division-by-zero () 0.0)))


(defun expnt-base (xarg)
  (let ((result 1.0)
	(xv (float-protect (abs xarg))))
    (if (< xv 15.0)
	(setq result xv))
    result))


(defun expnt-power (xarg)
  (let ((result 1.0)
	(xv (float-protect (round (abs xarg)))))
    (if (< xv 5.0)
	(setq result xv))
    result))


(defun expnt (x y)
  (handler-case (expt (expnt-base x) (expnt-power y))
                (floating-point-invalid-operation () 1.0)
		(division-by-zero () 0.0)
		(floating-point-underflow () 0.0)
		(floating-point-overflow () 1.0)))

(defun choose-from-terminal-set ()
  (let* ((r-state (make-random-state t))
	 (choice (nth (random (length terminal-set) r-state) terminal-set)))
    (case choice
      (:random-float-constant (random-float-constant))
      (:random-integer-constant (random-integer-constant))
      (X 'X))))

(defun choose-from-function-set ()
  (let ((r-state (make-random-state t)))
    (nth (random (length function-set) r-state) function-set)))


(defun prg-length (prg)
  "Counts cross-over points"
  (cond ((null prg) 0)
	((atom prg) 1)
	((consp prg) (+ (prg-length (first prg)) (prg-length (rest prg))))))

  
(defun rprg (fp d)
  (let ((r-state (make-random-state t)))
    (cond (fp (list (choose-from-function-set) (rprg nil (decf d)) (rprg nil (decf d))))
	  ((<= d 0) (choose-from-terminal-set))
	  (t (if (< (random 1.0 r-state) 0.5)
		 (list (choose-from-function-set) (rprg nil (decf d)) (rprg nil (decf d)))
		 (choose-from-terminal-set))))))
  


(defstruct individual
  (program nil)
  (fitness 0.0))

;;(defvar pop0 (make-array pop-size :initial-element nil))
;;(defvar parent-pool (make-array pop-size :initial-element nil))
;;(defvar child-pool (make-array pop-size :initial-element nil))
;;(defvar pop1 (make-array pop-size :initial-element nil))

;(defvar pop0 (make-array pop-size :initial-element (make-individual :program nil :fitness 0.0)))
;(defvar parent-pool (make-array pop-size :initial-element (make-individual :program nil :fitness 0.0)))
;(defvar child-pool (make-array pop-size :initial-element (make-individual :program nil :fitness 0.0)))
;(defvar pop1 (make-array pop-size :initial-element (make-individual :program nil :fitness 0.0)))

;(defvar pop0 (map-into (make-array pop-size) (lambda () (make-individual :program nil :fitness 0.0))))
;(defvar parent-pool (map-into (make-array pop-size) (lambda () (make-individual :program nil :fitness 0.0))))
;(defvar child-pool (map-into (make-array pop-size) (lambda () (make-individual :program nil :fitness 0.0))))
;(defvar pop1 (map-into (make-array pop-size) (lambda () (make-individual :program nil :fitness 0.0))))

;(defvar pop0 (map-into (make-array pop-size) (function make-individual)))
;(defvar parent-pool (map-into (make-array pop-size) (function make-individual)))
;(defvar child-pool (map-into (make-array pop-size) (function make-individual)))
;(defvar pop1 (map-into (make-array pop-size) (function make-individual)))


(defvar pop0 (make-array pop-size :initial-element (make-individual :program nil :fitness 0.0)))
(defvar parent-pool (make-array pop-size :initial-element (make-individual :program nil :fitness 0.0)))
(defvar child-pool (make-array pop-size :initial-element (make-individual :program nil :fitness 0.0)))
(defvar pop1 (make-array pop-size :initial-element (make-individual :program nil :fitness 0.0)))

(defun init-pops ()
  (dotimes (i pop-size)
    (setf (aref pop0 i) (make-individual :program nil :fitness 0.0))
    (setf (aref parent-pool i) (make-individual :program nil :fitness 0.0))
    (setf (aref child-pool i) (make-individual :program nil :fitness 0.0))
    (setf (aref pop1 i) (make-individual :program nil :fitness 0.0))))



(defun actual-function (xarg)
  (+ (* xarg xarg)
     xarg
     1))

;;(defvar x-values '(-10.0 -9.0 -8.0 -7.0 -6.0 -5.0 -4.0 -3.0 -2.0 -1.0 0.01 1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0)) 
(defvar x-values '(-1.0 -0.9 -0.8 -0.7 -0.6 -0.5 -0.4 -0.3 -0.2 -0.1 0.01 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0))
(defvar x -1.0)


(defun prg-fitness (prog)
  (let ((err 0.0))
    (dolist (xv x-values)
      (setq x xv)
      (setq err (+ err (abs (- (eval prog) (actual-function x))))))
    err))
    

(defun pop-fitness (cpop)
  (dotimes (ele pop-size)
    (setf (individual-fitness (aref cpop ele)) (prg-fitness (individual-program (aref cpop ele))))))



(defun init-pop0 ()
  (dotimes (i pop-size)
    (setf (aref pop0 i) (make-individual :program (rprg t 25) :fitness 0.0)))
  (dotimes (i pop-size)
    (let ((err 0.0))
      (setf (individual-fitness (aref pop0 i)) 0.0)
      (dolist (xv x-values)
;;	(format t "~&i = ~d : x = ~d~&" i xv)
	(setq x xv)
	(setq err (abs (- (eval (individual-program (aref pop0 i)))
			  (actual-function x))))
	(setf (individual-fitness (aref pop0 i)) (+ err
						    (individual-fitness (aref pop0 i))))))))

(defun generate-parent-pool-1 ()
  (let ((choice1 (random pop-size))
	(choice2 (random pop-size)))
    (loop
     (when (/= choice1 choice2) (return))
     (setq choice1 (random pop-size)) 
     (setq choice2 (random pop-size)))
    
   (dotimes (i pop-size)
     (if (< (individual-fitness (aref pop0 choice1))
	    (individual-fitness (aref pop0 choice2)))
	 (setf (aref parent-pool i) (aref pop0 choice1))
       (setf (aref parent-pool i) (aref pop0 choice2)))
     (setq choice1 (random pop-size)) 
     (setq choice2 (random pop-size))
     (loop
      (when (/= choice1 choice2) (return))
      (setq choice1 (random pop-size)) 
      (setq choice2 (random pop-size))))))
     
(defun generate-parent-pool-2 ()
  (let* ((rstate1 (make-random-state t))
	 (choice1 (random pop-size rstate1))
	 (choice2 (random pop-size rstate1)))
    (loop
     (when (/= choice1 choice2) (return))
     (setq choice1 (random pop-size rstate1)) 
     (setq choice2 (random pop-size rstate1)))

    (dotimes (i pop-size)
      (let ((r (random 1.0 rstate1)))

	(if (and (< r 0.85)
		 (< (individual-fitness (aref pop0 choice1))
		    (individual-fitness (aref pop0 choice2))))
	    (setf (aref parent-pool i) (aref pop0 choice1))
	  (setf (aref parent-pool i) (aref pop0 choice2)))

	(setq choice1 (random pop-size rstate1)) 
	(setq choice2 (random pop-size rstate1))
	(loop
	 (when (/= choice1 choice2) (return))
	 (setq choice1 (random pop-size rstate1)) 
	 (setq choice2 (random pop-size rstate1)))))))
  

(defun pass-elite ()
  (let ((most-fit 0)
	(most-fit-fitness (individual-fitness (aref pop0 0))))
  (dotimes (i pop-size)
    (if (< (individual-fitness (aref pop0 i))
	   most-fit-fitness)
	(progn
	  (setq most-fit i)
	  (setq most-fit-fitness (individual-fitness (aref pop0 i))))))
  (setf (aref pop1 0)
	(aref pop0 most-fit))))


(defun generate-pop0 ()
  (dotimes (i pop-size)
    (setf (aref pop0 i) (aref pop1 i))))

 

(defun subtree-i (prg i)
  (cond ((= i 1) prg)
	((atom prg) prg)
	((consp prg)
	 (let* ((left-subtree (second prg))
		(right-subtree (third prg))
		(left-subtree-length (prg-length left-subtree)))
	   (if (<= i (+ 1 left-subtree-length))
	       (subtree-i left-subtree (- i 1))
	     (subtree-i right-subtree (- i (+ 1 left-subtree-length))))))))
		
   


(defun loc-subtree-i (prg i location)
  (cond ((= i 1) location)
	((atom prg) location)
	((consp prg)
	 (let* ((left-subtree (second prg))
		(right-subtree (third prg))
		(left-subtree-length (prg-length left-subtree)))
	   (if (<= i (+ 1 left-subtree-length))
	       (loc-subtree-i left-subtree (- i 1) (append '(car cdr) location))
	       (loc-subtree-i right-subtree (- i (+ 1 left-subtree-length)) (append '(car cdr cdr) location)))))))
		


(defun place-list (locList tree)
  (let ((result tree))
    (dolist (cloc (reverse locList))
      (setq result (list cloc result)))
    result))
  

(defun setf-subtree (tree nv)
  `(setf ,tree ,nv))






;; (defvar male-n (random pop-size))
;; (defvar female-n (random pop-size))

;; (defvar male-n-tree (copy-tree (individual-program (aref parent-pool male-n))))
;; (defvar female-n-tree (copy-tree (individual-program (aref parent-pool female-n))))

;; (defvar male-n-xpoint-i (+ 2 (random (- (prg-length male-n-tree) 1))))
;; (defvar female-n-xpoint-i (+ 2 (random (- (prg-length female-n-tree) 1))))

;; (defvar male-n-subtree (copy-tree (subtree-i male-n-tree male-n-xpoint-i)))
;; (defvar female-n-subtree (copy-tree (subtree-i female-n-tree female-n-xpoint-i)))

;; (defvar male-locz (loc-subtree-i male-n-tree male-n-xpoint-i nil))
;; (defvar female-locz (loc-subtree-i female-n-tree female-n-xpoint-i nil))
(defvar male-n nil)
(defvar female-n nil)

(defvar male-n-tree nil)
(defvar female-n-tree nil)

(defvar male-n-xpoint-i nil)
(defvar female-n-xpoint-i nil)

(defvar male-n-subtree nil)
(defvar female-n-subtree nil)

(defvar male-locz nil)
(defvar female-locz nil)

(defvar parent1-tree nil)
(defvar parent2-tree nil)

(defvar child-count-1 0)


(defun generate-child-pool-1 ()
  (let ((rstate1 (make-random-state t)))
    (loop
       (when (= pop-size child-count-1) (setq child-count-1 0) (return))
       
       (setq male-n (random pop-size rstate1))
       (setq female-n (random pop-size rstate1))
       
       (setq male-n-tree (copy-tree (individual-program (aref parent-pool male-n))))
       (setq female-n-tree (copy-tree (individual-program (aref parent-pool female-n))))
       
       (setq male-n-xpoint-i (+ 2 (random (- (prg-length male-n-tree) 1) rstate1)))
       (setq female-n-xpoint-i (+ 2 (random (- (prg-length female-n-tree) 1) rstate1)))
       
       (setq male-n-subtree (copy-tree (subtree-i male-n-tree male-n-xpoint-i)))
       (setq female-n-subtree (copy-tree (subtree-i female-n-tree female-n-xpoint-i)))
       
       (setq male-locz (loc-subtree-i male-n-tree male-n-xpoint-i nil))
       (setq female-locz (loc-subtree-i female-n-tree female-n-xpoint-i nil))
       
       (setq parent1-tree male-n-tree)
       (setq parent2-tree female-n-tree)
       
       (eval (setf-subtree (place-list male-locz 'parent1-tree) female-n-subtree))
       (setf (individual-program (aref child-pool child-count-1)) parent1-tree)
					;       (setf (individual-program (aref child-pool child-count-1)) child-count-1)
       (incf child-count-1)       
       (eval (setf-subtree (place-list female-locz 'parent2-tree) male-n-subtree))
       (setf (individual-program (aref child-pool child-count-1)) parent2-tree)
					;       (setf (individual-program (aref child-pool child-count-1)) child-count-1)
       (incf child-count-1))))



(defun generate-child-pool-2 ()
  (let ((rstate1 (make-random-state t)))
    (loop
       (when (= pop-size child-count-1) (setq child-count-1 0) (return))
       
       (setq male-n (random pop-size rstate1))
       (setq female-n (random pop-size rstate1))
       
       (setq male-n-tree (copy-tree (individual-program (aref parent-pool male-n))))
       (setq female-n-tree (copy-tree (individual-program (aref parent-pool female-n))))
       
       (setq male-n-xpoint-i (+ 2 (random (- (prg-length male-n-tree) 1) rstate1)))
       (setq female-n-xpoint-i (+ 2 (random (- (prg-length female-n-tree) 1) rstate1)))
       
       (setq male-n-subtree (copy-tree (subtree-i male-n-tree male-n-xpoint-i)))
       (setq female-n-subtree (copy-tree (subtree-i female-n-tree female-n-xpoint-i)))
       
       (setq male-locz (loc-subtree-i male-n-tree male-n-xpoint-i nil))
       (setq female-locz (loc-subtree-i female-n-tree female-n-xpoint-i nil))
       
       (setq parent1-tree male-n-tree)
       (setq parent2-tree female-n-tree)
       
       (eval (setf-subtree (place-list male-locz 'parent1-tree) female-n-subtree))
;       (setf (individual-program (aref child-pool child-count-1)) parent1-tree)
					;       (setf (individual-program (aref child-pool child-count-1)) child-count-1)
;       (incf child-count-1)       
       (eval (setf-subtree (place-list female-locz 'parent2-tree) male-n-subtree))
;       (setf (individual-program (aref child-pool child-count-1)) parent2-tree)
					;       (setf (individual-program (aref child-pool child-count-1)) child-count-1)


       (if (< (prg-fitness parent1-tree) (prg-fitness parent2-tree))
	   (setf (individual-program (aref child-pool child-count-1)) parent1-tree)
	   (setf (individual-program (aref child-pool child-count-1)) parent2-tree))
       (incf child-count-1))))



	

;;(defvar tree1 '(+ (- 5 x) (- 5 x)))
;;(defvar tree2 '(/ (* 3.14159 2) (* 77.3 4.0)))
;;
;;(defun generate-a-child ()
;;  (let* ((tree1-xpoint (+ 2 (random (- (prg-length tree1) 1))))
;;	 (tree2-xpoint (+ 2 (random (- (prg-length tree2) 1))))
;;	 (tree2-subtree (copy-tree (subtree-i tree2 tree2-xpoint)))
;;	 (tree1-locz (loc-subtree-i tree1 tree1-xpoint nil)))
;;    (eval (setf-subtree (place-list tree1-locz 'tree1) tree2-subtree))))
	 



(defvar mutate-exp-tree nil)
(defvar mutate-exp-tree-xpoint nil)
(defvar mutate-exp-tree-locz nil)
(defvar mutate-exp-tree-nf nil)


;(defun mutate-tree (treearg)
;  (let* ((xpoint (+ 2 (random (- (prg-length treearg) 1))))
;	 (locz (loc-subtree-i treearg xpoint nil))
;	 (nf (rprg nil 25)))
;    (eval (setf-subtree (place-list locz treearg) nf))))
;    
;
;(defun mutate (ind1)
;  (setf (individual-program ind1) (mutate-tree (individual-program ind1)))) 


(defun mutate (ind1)
  (let ((rstate (make-random-state t)))
    (setf mutate-exp-tree (individual-program ind1))
    (setf mutate-exp-tree-xpoint (+ 2 (random (- (prg-length mutate-exp-tree) 1) rstate)))
    (setf mutate-exp-tree-locz (loc-subtree-i mutate-exp-tree mutate-exp-tree-xpoint nil))
    (setf mutate-exp-tree-nf (rprg nil 25))
    (eval (setf-subtree (place-list mutate-exp-tree-locz 'mutate-exp-tree) mutate-exp-tree-nf))
    (setf (individual-program ind1) mutate-exp-tree)
    ind1))



(defun generate-pop1 ()
  (let ((rstate (make-random-state t)))
    (dotimes (i pop-size)
      (let ((r (random 1.0 rstate)))
	(if (> i 0)
	    (if (< r 0.02)
					;(if nil
					;mutate
		(setf (aref pop1 i) (mutate (aref child-pool i)))
					;don't mutate
		(setf (aref pop1 i) (aref child-pool i))))))))
  
    
(defvar best-program nil)
(defvar best-fitness nil)
(defun get-best ()
  (setq best-program (individual-program (aref pop1 0)))
  (setq best-fitness (individual-fitness (aref pop1 0)))
  (dotimes (i pop-size)
    (if (< (individual-fitness (aref pop1 i))
	   best-fitness)
	(progn
	  (setq best-program (individual-program (aref pop1 i)))
	  (setq best-fitness (individual-fitness (aref pop1 i)))))))
	  

(defvar global-best-program nil)
(defvar global-best-fitness nil)
(defun update-global-best ()
    (if (or (and (null global-best-program)
		 (null global-best-fitness))
	    (< best-fitness global-best-fitness))
	(progn
	  (setq global-best-program best-program)
	  (setq global-best-fitness best-fitness))))

(defun init-globals () 
  (setq global-best-program nil)
  (setq global-best-fitness nil))


(defun driver ()
  (let ((iter-count 0) 
	(max-iter 100))
    
    (init-globals)
    
    (init-pops)
    
    (init-pop0)
    
    (loop
       
       (pass-elite)
       (generate-parent-pool-2)
       (pop-fitness parent-pool)
       (generate-child-pool-2)
       (pop-fitness child-pool)
       (generate-pop1)
       (pop-fitness pop1) 
       (generate-pop0)
       (get-best)
       (update-global-best)  
       (incf iter-count)
       (if (= 0 (mod iter-count (/ max-iter 10)))
	   (format t "generation = ~a ~%" iter-count))
       
       (when (>= iter-count max-iter) (return)))))


