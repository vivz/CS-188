
(defun power(base exp)
 ( if (eq exp 0) 1 ( * base (power base (- exp 1)) ) )
)
(power 10 3)

(defun non-nine (num num_of_zeros)
  (let*(
      (m (power 10 num_of_zeros))
      (num (/ num m))
      (num (* num m)))
  num))(non-nine 456 1)

(defun same-digit (NUM1 NUM2 &optional nlevel shift)
  (unless nlevel (setq nlevel 1))
  (unless shift (setq shift 1)) 
  (let* (
    (ndigit (length (number-to-string NUM1)))
    (shift (if(and (= ndigit 2) (= shift 1)) 0 shift)) ;special case for two digit
    (shifted_nlevel (+ shift nlevel)))
  (cond
    ((> NUM1 NUM2) nil)
    ((= NUM1 NUM2) (list (list NUM1 NUM1)))
    ((= 0 nlevel)  ;base case
      (list (list NUM1 NUM2))
    )
    (t ;non-base case
      (let*
        (
	 (nines (- (power 10 nlevel) 1)) 
	 (leading (if (or (= shift 1) (= shift 0))
		       (non-nine NUM1 nlevel) ;shift is 1 or 0
		       (- (non-nine NUM2 nlevel) (power 10 nlevel)) ;shift is -1
	 ))
         (test_upper (+ nines leading));compute upper limit
	 (upper (if(< test_upper NUM2) test_upper NUM2))
	 (new_shift (cond ((or (= -1 shift)(= 0 shift)) -1) ; calcualting the shift for next level
			  ((= ndigit (+ 1 shifted_nlevel)) 0)
			  (t 1)
	 ))
        ) 
	;recursive call
        (cons (list NUM1 upper) (same-digit (+ 1 upper) NUM2 shifted_nlevel new_shift) )
      )
    )
  ))
)(same-digit 300 324)


(defun num-search-forward (NUM1 &optional NUM2 BASE))
