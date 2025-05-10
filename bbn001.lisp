;
;  Markov Chain Monte Carlo demonstration.
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

(defvar *e* '((3 t) (4 t)))
(defvar *bn*
    '((0 nil nil (2 3 4) (0.001))
      (1 nil nil (2 3 4) (0.002))
      (2 (0 1) (0 1) (3 4) ((t t 0.95) (t f 0.94) (f t 0.29) (f f 0.001)))
      (3 (2) (0 1 2) nil ((t 0.90) (f 0.05)))
      (4 (2) (0 1 2) nil ((t 0.70) (f 0.01)))))



(defvar *bn5*
  '((4 (0) (0) NIL ((T 0.29156715) (F 0.10748577)))
    (3 (1 2) (0 1 2) NIL ((T T 0.42150503) (F T 0.4193647) 
			  (T F 0.8113355) (F F 0.41830182)))
    (2 (0) (0) (3) ((T 0.60192394) (F 0.7510031))) 
    (1 NIL NIL (3) (0.6981854)) 
    (0 NIL NIL (4 3 2) (0.7725208))))

(defvar *bn5e* '((3 T) (4 T)))


(defvar *bn10*
  '((9 (4) (0 4) NIL ((T 0.6325561) (F 0.24464858))) 
    (8 (0) (0) NIL ((T 0.38740534) (F 0.5821631)))
    (7 (0) (0) NIL ((T 0.9417171) (F 0.4087829))) 
    (6 (5) (0 1 2 5) NIL ((T 0.7155126) (F 0.66473526)))
    (5 (0 1 2) (0 1 2) (6)  ((T T T 0.7386731) (F T T 0.094326496) 
			     (T F T 0.23061097) (F F T 0.24894029) 
			     (T T F 0.15752602) (F T F 0.8076905) 
			     (T F F 0.80287313) (F F F 0.04484874)))
    (4 (0) (0) (9) ((T 0.9652306) (F 0.8817519))) 
    (3 (0) (0) NIL ((T 0.97481453) (F 0.027726948))) 
    (2 NIL NIL (6 5) (0.59176856))
    (1 NIL NIL (6 5) (0.42638463)) 
    (0 NIL NIL (9 8 7 6 5 4 3) (0.062363744))))

(defvar *bn10e* '((9 T) (8 T) (7 T)))


(defvar *bn15*
  '((14 (13) (3 6 13) NIL ((T 0.9775068) (F 0.6245608))) 
    (13 (6) (3 6) (14) ((T 0.74788237) (F 0.49125856)))
    (12 (7) (1 7) NIL ((T 0.7559286) (F 0.815489))) 
    (11 (9) (1 8 9) NIL ((T 0.6246627) (F 0.017879188)))
    (10 (7) (1 7) NIL ((T 0.48861235) (F 0.9624985))) 
    (9 (8) (1 8) (11) ((T 0.8801539) (F 0.20487934)))
    (8 (1) (1) (11 9) ((T 0.19122279) (F 0.44706488))) 
    (7 (1) (1) (12 10) ((T 0.79812855) (F 0.8495951)))
    (6 (3) (3) (14 13) ((T 0.46641576) (F 0.32528877)))
    (5 (1 2 3 4) (0 1 2 3 4) NIL ((T T T T 0.47802544) (F T T T 0.47676343) 
				  (T F T T 0.50726825) (F F T T 0.3313465) 
				  (T T F T 0.9080176) (F T F T 0.46132922)
				  (T F F T 0.33021086) (F F F T 0.6065106) 
				  (T T T F 0.9669767) (F T T F 0.45475447) 
				  (T F T F 0.066504896) (F F T F 0.545294)
				  (T T F F 0.8969906) (F T F F 0.8901664) 
				  (T F F F 0.48758364) (F F F F 0.33646202)))
    (4 (0) (0) (5) ((T 0.5869598) (F 0.521873))) 
    (3 NIL NIL (14 13 6 5) (0.18846709)) 
    (2 NIL NIL (5) (0.5584833))
    (1 NIL NIL (12 11 10 9 8 7 5) (0.5830125)) 
    (0 NIL NIL (5 4) (0.1960392))))

(defvar *bn15e* '((14 T) (13 F) (12 T) (11 F)))


(defvar *bn20*
  '((19 (9) (3 9) NIL ((T 0.73526055) (F 0.14874047))) 
    (18 (13) (3 13) NIL ((T 0.2815014) (F 0.8126592)))
    (17 (13) (3 13) NIL ((T 0.14207476) (F 0.57561135))) 
    (16 (14) (2 3 7 14) NIL ((T 0.2791353) (F 0.8476576)))
    (15 (12) (2 8 12) NIL ((T 0.56426275) (F 0.24926126))) 
    (14 (7) (2 3 7) (16) ((T 0.2579453) (F 0.8545125)))
    (13 (3) (3) (18 17) ((T 0.29649866) (F 0.2422902))) 
    (12 (8) (2 8) (15) ((T 0.20687246) (F 0.9262629)))
    (11 (1 2) (1 2) NIL ((T T 0.07886869) (F T 0.18380463) 
			 (T F 0.0069234967) (F F 0.2199775)))
    (10 (1) (1) NIL ((T 0.8722613) (F 0.3334328))) 
    (9 (3) (3) (19) ((T 0.50768876) (F 0.48998177)))
    (8 (2) (2) (15 12) ((T 0.41317868) (F 0.8920158)))
    (7 (2 3) (2 3) (16 14) ((T T 0.69485855) (F T 0.56394804) 
			    (T F 0.9391277) (F F 0.40299052)))
    (6 (3 5) (3 5) NIL ((T T 0.8674976) (F T 0.8533482) 
			(T F 0.8970719) (F F 0.3209955))) 
    (5 NIL NIL (6) (0.1265887))
    (4 NIL NIL NIL (0.37103826)) 
    (3 NIL NIL (19 18 17 16 14 13 9 7 6) (0.56889087)) 
    (2 NIL NIL (16 15 14 12 11 8 7) (0.11823535))
    (1 NIL NIL (11 10) (0.98450565)) (0 NIL NIL NIL (0.51384425))))


(defvar *bn20e* '((19 T) (18 F) (17 T) (16 F) (15 T)))


(defvar *bn25*
  '((24 (22) (3 5 12 14 16 17 22) NIL ((T 0.37207097) (F 0.22888213)))
    (23 (2 9) (2 5 9) NIL ((T T 0.8603738) (F T 0.3074605) (T F 0.8978976) (F F 0.3768381)))
    (22 (17) (3 5 12 14 16 17) (24) ((T 0.38191366) (F 0.50710255)))
    (21 (4 5) (4 5) NIL ((T T 0.83341974) (F T 0.20652962) (T F 0.40816855) (F F 0.03817153)))
    (20 (0) (0) NIL ((T 0.8105241) (F 0.97389436))) 
    (19 (13) (0 1 2 3 4 6 7 8 11 13) NIL ((T 0.22072369) (F 0.015107036)))
    (18 (1) (1) NIL ((T 0.8167209) (F 0.14441347))) 
    (17 (16) (3 5 12 14 16) (24 22) ((T 0.9274089) (F 0.014755905)))
    (16 (14) (3 5 12 14) (24 22 17) ((T 0.12161565) (F 0.057700396)))
    (15 (9 10) (1 5 9 10) NIL ((T T 0.40543282) (F T 0.68319345) (T F 0.46388286) (F F 0.07690966)))
    (14 (5 12) (3 5 12) (24 22 17 16) ((T T 0.9507364) (F T 0.31943953) (T F 0.1771524) (F F 0.39672375)))
    (13 (11) (0 1 2 3 4 6 7 8 11) (19) ((T 0.78361285) (F 0.2794993))) 
    (12 (3) (3) (24 22 17 16 14) ((T 0.7541963) (F 0.41396064)))
    (11 (0 8) (0 1 2 3 4 6 7 8) (19 13) ((T T 0.8070455) (F T 0.05446452) (T F 0.94383466) (F F 0.8175045)))
    (10 (1) (1) (15) ((T 0.26709783) (F 0.86466545))) 
    (9 (5) (5) (23 15) ((T 0.8075304) (F 0.9608078)))
    (8 (4 7) (1 2 3 4 6 7) (19 13 11) ((T T 0.10722691) (F T 0.1476571) (T F 0.9750627) (F F 0.09507626)))
    (7 (1 2 3 6) (1 2 3 6) (19 13 11 8)
     ((T T T T 0.4204601) (F T T T 0.8304584) (T F T T 0.19698435) (F F T T 0.4768986) (T T F T 0.7703296) (F T F T 0.5479068)
      (T F F T 0.042135) (F F F T 0.70172703) (T T T F 0.97652864) (F T T F 0.8970664) (T F T F 0.20802194) (F F T F 0.4687873)
      (T T F F 0.4961819) (F T F F 0.492545) (T F F F 0.7684346) (F F F F 0.41908586)))
    (6 NIL NIL (19 13 11 8 7) (0.75115204)) 
    (5 NIL NIL (24 23 22 21 17 16 15 14 9) (0.38199288))
    (4 NIL NIL (21 19 13 11 8) (0.3901611)) 
    (3 NIL NIL (24 22 19 17 16 14 13 12 11 8 7) (0.9333742))
    (2 NIL NIL (23 19 13 11 8 7) (0.8731316)) 
    (1 NIL NIL (19 18 15 13 11 10 8 7) (0.64025295))
    (0 NIL NIL (20 19 13 11) (0.2391184))))

(defvar *bn25e* '((24 T) (23 F) (22 T) (21 T) (20 F) (19 T)))



(defvar *bn30*
  '((29 (20) (0 8 10 11 20) NIL ((T 0.0038186908) (F 0.40659094))) 
    (28 (8) (8) NIL ((T 0.73618704) (F 0.048738003)))
    (27 (18) (0 3 4 5 6 7 9 15 18) NIL ((T 0.14573735) (F 0.46819067))) 
    (26 (3) (3) NIL ((T 0.8736357) (F 0.16190106)))
    (25 (9) (0 3 4 5 6 7 9) NIL ((T 0.8263814) (F 0.57578236))) 
    (24 (14) (5 14) NIL ((T 0.7984271) (F 0.21832478)))
    (23 (7) (7) NIL ((T 0.98287404) (F 0.68120223))) 
    (22 (20) (0 8 10 11 20) NIL ((T 0.59851843) (F 0.87895864)))
    (21 (19) (6 19) NIL ((T 0.063627005) (F 0.35146177))) 
    (20 (11) (0 8 10 11) (29 22) ((T 0.6709675) (F 0.103576064)))
    (19 (6) (6) (21) ((T 0.3052222) (F 0.8554469))) 
    (18 (15) (0 3 4 5 6 7 9 15) (27) ((T 0.78183275) (F 0.44747955)))
    (17 (14) (5 14) NIL ((T 0.9514305) (F 0.63490766))) 
    (16 (13) (2 5 13) NIL ((T 0.025988102) (F 0.87838954)))
    (15 (9) (0 3 4 5 6 7 9) (27 18) ((T 0.8319074) (F 0.06872219))) 
    (14 (5) (5) (24 17) ((T 0.15882033) (F 0.46902192)))
    (13 (2 5) (2 5) (16) ((T T 0.891153) (F T 0.6662186) (T F 0.97370696) (F F 0.29456484)))
    (12 (10) (0 8 10) NIL ((T 0.54047966) (F 0.38176703))) 
    (11 (10) (0 8 10) (29 22 20) ((T 0.72008777) (F 0.93280935)))
    (10 (0 8) (0 8) (29 22 20 12 11) ((T T 0.8907721) (F T 0.51455265) (T F 0.55247116) (F F 0.4422186)))
    (9 (0 3 4 5 6 7) (0 3 4 5 6 7) (27 25 18 15)
     ((T T T T T T 0.70008713) (F T T T T T 0.37817776) (T F T T T T 0.47929257) (F F T T T T 0.75891817) (T T F T T T 0.13451403)
      (F T F T T T 0.6792535) (T F F T T T 0.5055344) (F F F T T T 0.53881425) (T T T F T T 0.26834136) (F T T F T T 0.5091589)
      (T F T F T T 0.8356176) (F F T F T T 0.34236628) (T T F F T T 0.11222464) (F T F F T T 0.6663653) (T F F F T T 0.45143914)
      (F F F F T T 0.84585834) (T T T T F T 0.49603355) (F T T T F T 0.30421883) (T F T T F T 0.025770485) (F F T T F T 0.69078404)
      (T T F T F T 0.89798313) (F T F T F T 0.63654107) (T F F T F T 0.6691727) (F F F T F T 0.97923285) (T T T F F T 0.1584816)
      (F T T F F T 0.61356324) (T F T F F T 0.49281043) (F F T F F T 0.69728196) (T T F F F T 0.58827573) (F T F F F T 0.77430916)
      (T F F F F T 0.62125903) (F F F F F T 0.8169421) (T T T T T F 0.9365332) (F T T T T F 0.23056602) (T F T T T F 0.8782664)
      (F F T T T F 0.9902935) (T T F T T F 0.5936764) (F T F T T F 0.75223106) (T F F T T F 0.78542256) (F F F T T F 0.5531579)
      (T T T F T F 0.016091287) (F T T F T F 0.95409423) (T F T F T F 0.50880885) (F F T F T F 0.74998856) (T T F F T F 0.42526156)
      (F T F F T F 0.38001782) (T F F F T F 0.7119383) (F F F F T F 0.42662108) (T T T T F F 0.10243422) (F T T T F F 0.5919943)
      (T F T T F F 0.67466897) (F F T T F F 0.66311526) (T T F T F F 0.821602) (F T F T F F 0.9487149) (T F F T F F 0.26726115)
      (F F F T F F 0.6851262) (T T T F F F 0.88839376) (F T T F F F 0.35105348) (T F T F F F 0.17636883) (F F T F F F 0.6490818)
      (T T F F F F 0.63039213) (F T F F F F 0.5902681) (T F F F F F 0.91549724) (F F F F F F 0.29390347)))
    (8 NIL NIL (29 28 22 20 12 11 10) (0.85161036)) 
    (7 NIL NIL (27 25 23 18 15 9) (0.28043878))
    (6 NIL NIL (27 25 21 19 18 15 9) (0.8815824)) 
    (5 NIL NIL (27 25 24 18 17 16 15 14 13 9) (0.19889611))
    (4 NIL NIL (27 25 18 15 9) (0.25636667)) 
    (3 NIL NIL (27 26 25 18 15 9) (0.10169923)) (2 NIL NIL (16 13) (0.9456275))
    (1 NIL NIL NIL (0.14781767)) 
    (0 NIL NIL (29 27 25 22 20 18 15 12 11 10 9) (0.40023232))))
  

(defvar *bn30e* '((29 T) (28 T) (27 F) (26 F) (25 T) (24 T) (23 T)))




(defun has-value (y e)
  (cadr (assoc y e)))

(defun get-node (n bn)
  (dolist (node bn)
    (if (= n (car node))
	(return node))))

(defun parents (node bn)
  (let ((cnode (get-node node bn)))
    (cadr cnode)))

(defun parents-values (n e bn)
  (let ((pns (parents n bn))
	(result nil))
    (dolist (p pns)
      (setq result (cons (cadr (assoc p e)) result)))
    (reverse result)))

(defun ttable-v (n bn)
  (let ((cnode (get-node n bn))
	(result nil))
    (dolist (ttv (fifth cnode))
      (setq result (cons (butlast ttv) result)))
    (reverse result)))
   
(defun cpt-lookup (n e bn)
  (let* ((cnode (get-node n bn))
	 (pvs (parents-values n e bn)))
    (if (null pvs)
	(car (fifth cnode))
	(car (last (nth (position pvs (ttable-v n bn) :test #'equalp) (fifth cnode)))))))
	  
(defun cpt-lookup-t (n e bn) (cpt-lookup n e bn))
(defun cpt-lookup-f (n e bn) (- 1.0 (cpt-lookup n e bn)))

(defun vars (bn)
  (let ((result nil))
    (dolist (n bn)
      (setq result (cons (car n) result)))
    (sort result #'<)))

(defun normalize (v)
  (let ((array-length (length v))
	(total 0.0))
    (dotimes (i array-length)
      (setq total (+ total (aref v i))))
    (dotimes (i array-length)
      (setf (aref v i) (/ (aref v i) total)))))

(defun enumerate-all (vrs e bn)
  (if (null vrs) 
      1.0
      (let* ((greaty (car vrs))
	     (smally (has-value greaty e)))
	(cond ((eq smally 't) (* (cpt-lookup-t greaty e bn)
				(enumerate-all (cdr vrs) e bn)))
	      ((eq smally 'f) (* (cpt-lookup-f greaty e bn)
				(enumerate-all (cdr vrs) e bn)))
	      ((null smally)
		(+ (* (cpt-lookup-t greaty e bn)
		      (enumerate-all (cdr vrs) (cons (list greaty 't) e) bn))
		   (* (cpt-lookup-f greaty e bn)
		      (enumerate-all (cdr vrs) (cons (list greaty 'f) e) bn))))))))

(defun enumeration-ask (X e bn)
  (let ((ee nil)
	(qxi (make-array 2 :initial-element nil)))
    (setq ee (cons (list X 't) e))
    (setf (aref qxi 0) (enumerate-all (vars bn) ee bn))
    (setq ee (cons (list X 'f) e))
    (setf (aref qxi 1) (enumerate-all (vars bn) ee bn))
    (normalize qxi)
    qxi))

(defun W-index (val)
  (cond ((eq val 't) 0)
	((eq val 'f) 1)
	(t 'BOOM)))

(defun W-val (gx wso)
  (let ((x (car wso)))
    (aref x gx)))

(defun e-to-x-transfer (e x)
  (dolist (i e)
    (setf (aref x (car i)) (cadr i))))


(defun likelyhood-weighting (X e bn N)
  (let ((W (make-array 2 :initial-element 0.0))
	(XW nil))
    (dotimes (j N)
      (setq XW (weighted-sample bn e))
      (setf (aref W (W-index (W-val X XW))) (+ (aref W (W-index (W-val X XW)))
					       (car (last XW)))))
    (normalize W)
    W))


(defun weighted-sample (bn e)
  (let* ((n (length bn)) 
	 (xevnt (make-array n :initial-element nil))
	 (weight 1.0))
    (dotimes (Xi n)
      (cond ((eq (has-value Xi e) 't) (setq weight (* weight
						     (cpt-lookup-t Xi e bn))))
	    ((eq (has-value Xi e) 'f) (setq weight (* weight
						     (cpt-lookup-f Xi e bn))))
	    ((null (has-value Xi e))
	     (setq e (cons (list Xi
				 (let ((rand (random 1.0)))
				   (if (<= rand (cpt-lookup-t Xi e bn))
				       't
				       'f))) e)))))
    (e-to-x-transfer e xevnt)
    (list xevnt weight)))


     

(defun generateZ (e bn)
  (let ((all-nodes (vars bn))
	(evidence-nodes (vars e)))
    (set-difference all-nodes evidence-nodes)))
	
(defun random-tf ()
  (let ((rand (random 1.0)))
    (if (< rand 0.5)
	't
	'f)))

(defun children (node bn)
  (let ((result nil))
    (dolist (n bn)
      (if (member node (cadr n))
	  (setq result (cons (car n) result))))
    result))

(defun markov-blanket-nodes (node bn)
  (let* ((mbp (parents node bn))
	 (mbc (children node bn))
	 (result (union mbp mbc))
	 (mbpc nil))
    (dolist (c mbc)
      (setq mbpc (union (parents c bn) mbpc)))
    (setq mbpc (remove node mbpc))
    (union result mbpc)))

(defun markov-blanket (node event bn)
  (let ((mbns (markov-blanket-nodes node bn))
	(result nil))
    (dolist (mbn mbns)
      (setq result (cons (list mbn (has-value mbn event)) result)))
    result))


(defun pmb-t (node event bn)
  (let* ((alpha (alphaF node event bn))
;;	(mb (markov-blanket node event bn))
	(np (cpt-lookup-t node event bn))
	(cp 1.0))
    (dolist (cxi (children node bn))
      (cond ((eq (has-value cxi event) 't) (setq cp (* cp (cpt-lookup-t cxi event bn))))
	    ((eq (has-value cxi event) 'f) (setq cp (* cp (cpt-lookup-f cxi event bn))))))
    (* alpha np cp)))
    
    
(defun pmb-f (node event bn)
  (let* ((alpha (alphaF node event bn))
;;	(mb (markov-blanket node event bn))
	(np (cpt-lookup-f node event bn))
	(cp 1.0))
    (dolist (cxi (children node bn))
      (cond ((eq (has-value cxi event) 't) (setq cp (* cp (cpt-lookup-t cxi event bn))))
	    ((eq (has-value cxi event) 'f) (setq cp (* cp (cpt-lookup-f cxi event bn))))))
    (* alpha np cp)))


(defun alphaF (node event bn)
    (let* ((trueProb 1.0)
           (falseProb 1.0)
           (localEventTrue (copy-tree event))
           (localEventFalse (copy-tree event))
           (trueCP 1.0)
           (falseCP 1.0))

    (setf (cadr (assoc node localEventTrue)) 't)
    (setf (cadr (assoc node localEventFalse)) 'f)
    
    (dolist (cxi (children node bn))
       (cond ((eq (has-value cxi localEventTrue) 't) (setq trueCP (* trueCP (cpt-lookup-t cxi localEventTrue bn))))
             ((eq (has-value cxi localEventTrue) 'f) (setq trueCP (* trueCP (cpt-lookup-t cxi localEventTrue bn))))))

    (dolist (cxi (children node bn))
       (cond ((eq (has-value cxi localEventFalse) 't) (setq falseCP (* falseCP (cpt-lookup-t cxi localEventFalse bn))))
             ((eq (has-value cxi localEventFalse) 'f) (setq falseCP (* falseCP (cpt-lookup-t cxi localEventFalse bn))))))
  
    (setq trueProb (* (cpt-lookup-t node localEventTrue bn) trueCP))
    (setq falseProb (* (cpt-lookup-f node localEventFalse bn) falseCP))

    (/ 1.0 (+ trueProb falseProb))))

    
(defun mcmc-ask (X e bn N)
  (let* ((NV (make-array 2 :initial-element 0.0))
	 (Z (generateZ e bn))
	 (xv (copy-tree e)))

    (dolist (node Z)
      (setq xv (cons (list node (random-tf)) xv)))
    
    (dotimes (j N)

      (dolist (zi Z)

	(let ((ziv (has-value zi xv))
	      (r (random 1.0)))

	  (cond ((eq ziv 't)
		 (if (> r (pmb-t zi xv bn))
		     (setf (cadr (assoc zi xv)) 'f)))
		((eq ziv 'f)
		 (if (> r (pmb-f zi xv bn))
		     (setf (cadr (assoc zi xv)) 't)))))

	(cond ((eq 't (has-value X xv)) (setf (aref NV 0) (+ 1.0 (aref NV 0))))
	      ((eq 'f (has-value X xv)) (setf (aref NV 1) (+ 1.0 (aref NV 1)))))))

    (normalize NV)
    NV))


(defun test-driver ()
  (let ((ts 0)
	(tf 0)
	(et 0)
	(enumAskResults nil)
	(likelyHoodResults nil)
	(mcmcAskResults nil))


    ;; enumeration-ask test battery

    (setq ts (get-internal-real-time))
    (setq enumAskResults (cons (enumeration-ask 0 *bn5e* *bn5*) enumAskResults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%5 nodes: enumeration-ask elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    
    
    (setq ts (get-internal-real-time))
    (setq enumAskResults (cons (enumeration-ask 0 *bn10e* *bn10*) enumAskResults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%10 nodes: enumeration-ask elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    
    (setq ts (get-internal-real-time))
    (setq enumAskResults (cons (enumeration-ask 0 *bn15e* *bn15*) enumAskResults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%15 nodes: enumeration-ask elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    
    
    (setq ts (get-internal-real-time))
    (setq enumAskResults (cons (enumeration-ask 0 *bn20e* *bn20*) enumAskResults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%20 nodes: enumeration-ask elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    
    
    (setq ts (get-internal-real-time))
    (setq enumAskResults (cons (enumeration-ask 0 *bn25e* *bn25*) enumAskResults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%25 nodes: enumeration-ask elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    
    
    (setq ts (get-internal-real-time))
    (setq enumAskResults (cons (enumeration-ask 0 *bn30e* *bn30*) enumAskResults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%30 nodes: enumeration-ask elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    
    

    ;; likelyhood-weighting test battery
    
    (setq ts (get-internal-real-time))
    (setq likelyhoodResults (cons (likelyhood-weighting 0 *bn5e* *bn5* 100000) likelyhoodResults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%5 nodes: likelyhood-weighting 100000 elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    (format t "~%5 nodes: likelyhood-weighting 100000 relative error w/respect to enumeration-ask = ~a ~%"
	    (/ (abs (- (aref (first likelyhoodResults) 0) (aref (sixth enumAskResults) 0))) (aref (sixth enumAskResults) 0)))
    
    (setq ts (get-internal-real-time))
    (setq likelyhoodResults (cons (likelyhood-weighting 0 *bn10e* *bn10* 100000) likelyhoodResults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%10 nodes: likelyhood-weighting 100000 elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    (format t "~%10 nodes: likelyhood-weighting 100000 relative error w/respect to enumeration-ask = ~a ~%"
	    (/ (abs (- (aref (first likelyhoodResults) 0) (aref (fifth enumAskResults) 0))) (aref (fifth enumAskResults) 0)))
    
    (setq ts (get-internal-real-time))
    (setq likelyhoodResults (cons (likelyhood-weighting 0 *bn15e* *bn15* 100000) likelyhoodResults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%15 nodes: likelyhood-weighting 100000 elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    (format t "~%15 nodes: likelyhood-weighting 100000 relative error w/respect to enumeration-ask = ~a ~%"
	    (/ (abs (- (aref (first likelyhoodResults) 0) (aref (fourth enumAskResults) 0))) (aref (fourth enumAskResults) 0)))


    (setq ts (get-internal-real-time))
    (setq likelyhoodResults (cons (likelyhood-weighting 0 *bn20e* *bn20* 100000) likelyhoodResults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%20 nodes: likelyhood-weighting 100000 elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    (format t "~%20 nodes: likelyhood-weighting 100000 relative error w/respect to enumeration-ask = ~a ~%"
	    (/ (abs (- (aref (first likelyhoodResults) 0) (aref (third enumAskResults) 0))) (aref (third enumAskResults) 0)))


    (setq ts (get-internal-real-time))
    (setq likelyhoodResults (cons (likelyhood-weighting 0 *bn25e* *bn25* 100000) likelyhoodResults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%25 nodes: likelyhood-weighting 100000 elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    (format t "~%25 nodes: likelyhood-weighting 100000 relative error w/respect to enumeration-ask = ~a ~%"
	    (/ (abs (- (aref (first likelyhoodResults) 0) (aref (second enumAskResults) 0))) (aref (second enumAskResults) 0)))


    (setq ts (get-internal-real-time))
    (setq likelyhoodResults (cons (likelyhood-weighting 0 *bn30e* *bn30* 100000) likelyhoodResults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%30 nodes: likelyhood-weighting 100000 elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    (format t "~%30 nodes: likelyhood-weighting 100000 relative error w/respect to enumeration-ask = ~a ~%"
	    (/ (abs (- (aref (first likelyhoodResults) 0) (aref (first enumAskResults) 0))) (aref (first enumAskResults) 0)))


    ;; mcmc-ask test battery

    (setq ts (get-internal-real-time))
    (setq mcmcaskresults (cons (mcmc-ask 0 *bn5e* *bn5* 100000) mcmcaskresults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%5 nodes: mcmc-ask 100000 elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    (format t "~%5 nodes: mcmc-ask 100000 relative error w/respect to enumeration-ask = ~a ~%"
	    (/ (abs (- (aref (first mcmcaskresults) 0) (aref (sixth enumAskResults) 0))) (aref (sixth enumAskResults) 0)))


    (setq ts (get-internal-real-time))
    (setq mcmcaskresults (cons (mcmc-ask 0 *bn10e* *bn10* 100000) mcmcaskresults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%10 nodes: mcmc-ask 100000 elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    (format t "~%10 nodes: mcmc-ask 100000 relative error w/respect to enumeration-ask = ~a ~%"
	    (/ (abs (- (aref (first mcmcaskresults) 0) (aref (fifth enumAskResults) 0))) (aref (fifth enumAskResults) 0)))

    (setq ts (get-internal-real-time))
    (setq mcmcaskresults (cons (mcmc-ask 0 *bn15e* *bn15* 100000) mcmcaskresults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%15 nodes: mcmc-ask 100000 elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    (format t "~%15 nodes: mcmc-ask 100000 relative error w/respect to enumeration-ask = ~a ~%"
	    (/ (abs (- (aref (first mcmcaskresults) 0) (aref (fourth enumAskResults) 0))) (aref (fourth enumAskResults) 0)))


    (setq ts (get-internal-real-time))
    (setq mcmcaskresults (cons (mcmc-ask 0 *bn20e* *bn20* 100000) mcmcaskresults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%20 nodes: mcmc-ask 100000 elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    (format t "~%20 nodes: mcmc-ask 100000 relative error w/respect to enumeration-ask = ~a ~%"
	    (/ (abs (- (aref (first mcmcaskresults) 0) (aref (third enumAskResults) 0))) (aref (third enumAskResults) 0)))


    (setq ts (get-internal-real-time))
    (setq mcmcaskresults (cons (mcmc-ask 0 *bn25e* *bn25* 100000) mcmcaskresults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%25 nodes: mcmc-ask 100000 elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    (format t "~%25 nodes: mcmc-ask 100000 relative error w/respect to enumeration-ask = ~a ~%"
	    (/ (abs (- (aref (first mcmcaskresults) 0) (aref (second enumAskResults) 0))) (aref (second enumAskResults) 0)))


    (setq ts (get-internal-real-time))
    (setq mcmcaskresults (cons (mcmc-ask 0 *bn30e* *bn30* 100000) mcmcaskresults))
    (setq tf (get-internal-real-time))
    (setq et (- tf ts))
    (format t "~%30 nodes: mcmc-ask 100000 elapsed time = ~a seconds~%" (* et (/ 1.0 internal-time-units-per-second)))
    (format t "~%30 nodes: mcmc-ask 100000 relative error w/respect to enumeration-ask = ~a ~%"
	    (/ (abs (- (aref (first mcmcaskresults) 0) (aref (first enumAskResults) 0))) (aref (first enumAskResults) 0)))


))
