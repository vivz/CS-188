
(defun power(base exp)
 ( if (eq exp 0) 1 ( * base (power base (- exp 1)) ) )
)
(power 10 3)

(defun non-nine (num num_of_zeros)
  (let*(
      (m (power 10 num_of_zeros))
      (num (/ num m))
      (num (* num m)))
  num))

(defun same-digit (NUM1 NUM2 nlevel shift)
  (let (
    (ndigit (length (number-to-string NUM1)))
    (shifted_nlevel (+ shift nlevel)))
  (cond
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
		   )
	 )
         (upper (+ nines leading))
	 (new_shift (cond ((or (= -1 shift)(= 0 shift)) -1)
			  ((= ndigit (+ 1 shifted_nlevel)) 0)
			  (t 1)
		    )
	 )
        ) 
	;recursive call
        (cons (list NUM1 upper) (same-digit (+ 1 upper) NUM2 shifted_nlevel new_shift) )
      )
    )
  ))
)
(same-digit 1323 2856 1 1)



(defun find-range (NUM1 NUM2 nlevel)

)



(defun num-search-forward (NUM1 &optional NUM2 BASE))
