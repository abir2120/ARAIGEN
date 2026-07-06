;=========================================================
; ARAIGEN V0.1
; Developer : Abir + ChatGPT
; AutoCAD 2026
;=========================================================

(vl-load-com)

(defun AR:Message (msg)
  (princ (strcat "\n[ARAIGEN] " msg))
)

(defun AR:CreateLayer (name color /)
  (if (not (tblsearch "LAYER" name))
    (command
      "_.-LAYER"
      "_M" name
      "_C" color ""
      ""
    )
  )
)

(defun AR:SetupLayers ()

  (AR:CreateLayer "A-WALL" "7")
  (AR:CreateLayer "A-DOOR" "2")
  (AR:CreateLayer "A-WINDOW" "4")
  (AR:CreateLayer "A-TEXT" "3")
  (AR:CreateLayer "A-DIM" "1")

  (setvar "CLAYER" "A-WALL")

)

(defun c:AIGEN ( / )

  (AR:Message "Initializing...")

  (AR:SetupLayers)

  (alert
    (strcat
      "ARAIGEN V0.1"
      "\n\n"
      "System Ready."
      "\n\n"
      "Next Version:"
      "\nModern GUI"
    )
  )

  (AR:Message "Ready.")

  (princ)

)

(princ "\n=================================")
(princ "\nARAIGEN Loaded Successfully")
(princ "\nCommand : AIGEN")
(princ "\n=================================")
(princ)