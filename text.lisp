(defparameter *location* 'living-room)

(defparameter *nodes* '(
	(garden (you are in a beautiful garden. there is a well in front of you.))
	(living-room (you are in a living-room. a wizard snores loudly.))
	(basement (you are in a basement. the dimly lit room is full of boxes.))
	(attic (you are in an attic. there is a torch in the corner.))
	))
	
(defparameter *edges* '(
	(garden (living-room west door))
	(living-room (garden east door) (attic up trapdoor) (basement down stair-case))
	(basement (living-room up stair-case))
	(attic (living-room down trapdoor))
	))
	
(defparameter *items* '(
	(living-room (whiskey-bottle glass-cup picture))
	(basement (broom dead-rat))
	(garden (flower water-bucket))
	(attic (candle blanket))
	))

(defparameter *inventory* '())

(defparameter *cmd-list* '(look walk pickup drop))

(defun loc-desc (loc nodes)
	(cadr (assoc loc nodes))
)

(defun path-desc (path)
	`(there is a ,(caddr path) going ,(cadr path) from here.)
)

(defun paths-desc (loc path)
	(apply #'append (mapcar #'path-desc (cdr (assoc loc path))))
)

(defun objects-desc (loc objs)
	(labels (
		(objdesc (obj)
			`(you see a ,obj here.)))
		(apply #'append (mapcar #'objdesc (cadr (assoc loc objs))))
	)
)

(defun look ()
	(print (append 
		(loc-desc *location* *nodes*)
		(paths-desc *location* *edges*)
		(objects-desc *location* *items*)))
)

(defun move (loc)
	(if (find loc (mapcar #'car (cdr (assoc *location* *edges*))))
		(progn (setf *location* loc)
			(look))
		'(you cannot go that way.))
)

(defun pickup (object)
	(if (find object (cadr (assoc *location* *items*)))
		(progn (push object *inventory*)
			(setf (cadr (car *items*)) (remove object (cadr (car *items*))))
			(print `(you are now carrying the ,object)))
		(print '(cound not find that object.)))
)

;(look)




