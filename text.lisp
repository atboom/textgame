(defparameter *nodes* '(
	(garden (you are in a beautiful garden. there is a well in front of you))
	(living-room (you are in a living-room. a wizard snores loudly))
	(basement (you are in a basement. the dimly lit room is full of boxes))
	(attic (you are in an attic. there is a torch in the corner))
	))
	
(defparameter *edges* '(
	(garden (living-room west door))
	(living-room (garden east door) (attic stairsup trapdoor) (basement stairsdown stairs))
	(basement (living-room stairsup stairs))
	(attic (living-room stairsdown trapdoor))
	))
	
(defparameter *items* '(
	(living-room (whiskey-bottle glass picture))
	(basement (broom dead-rat))
	(garden (flower water-bucket))
	(attic (candle blanket))
	))

(defparameter *cmd-list* '(look pickup walk))

(defun loc-desc (loc nodes)
	(cadr (assoc loc nodes))
	)

(print "success")
