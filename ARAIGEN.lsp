;==========================================================
; ARAIGEN
; Version : 0.1
; Developer : Abir + ChatGPT
;==========================================================

(vl-load-com)

(setq *AR-Version* "0.1")
(setq *AR-Name* "ARAIGEN")

(defun AR:Msg (txt)
    (princ (strcat "\n[" *AR-Name* "] " txt))
)

(defun AR:CreateLayer (lname col /)
    (if (not (tblsearch "LAYER" lname))
        (command
            "_.-LAYER"
            "_M" lname
            "_C" col ""
            ""
        )
    )
)

(defun AR:Init ()

    (AR:Msg "Initializing...")

    (AR:CreateLayer "A-WALL" "7")
    (AR:CreateLayer "A-DOOR" "2")
    (AR:CreateLayer "A-WINDOW" "4")
    (AR:CreateLayer "A-TEXT" "3")
    (AR:CreateLayer "A-DIM" "1")

    (setvar "CLAYER" "A-WALL")

    T
)
(defun AR:DrawBoundary (w l / p1 p2 p3 p4)

    (setq p1 (list 0.0 0.0))
    (setq p2 (list w 0.0))
    (setq p3 (list w l))
    (setq p4 (list 0.0 l))

    (command
        "_.PLINE"
        p1
        p2
        p3
        p4
        "_C"
    )

    (princ)

)
(defun AR:Launch (/ dcl_id result)

    (setq dcl_id (load_dialog "ARAIGEN.dcl"))

    (if (< dcl_id 0)
        (progn
            (alert "Cannot load ARAIGEN.dcl")
            (exit)
        )
    )

    (if (not (new_dialog "araigen" dcl_id))
        (progn
            (alert "Cannot open dialog.")
            (unload_dialog dcl_id)
            (exit)
        )
    )

    ;; Default Values
    (set_tile "plotw" "24")
    (set_tile "plotl" "45")
    (set_tile "bed" "3")
    (set_tile "bath" "2")
    (set_tile "kitchen" "1")

    ;; OK Button
    (action_tile
        "accept"
        "(setq *AR-PlotW* (atof (get_tile \"plotw\")))
         (setq *AR-PlotL* (atof (get_tile \"plotl\")))
         (done_dialog 1)"
    )

    ;; Cancel Button
    (action_tile
        "cancel"
        "(done_dialog 0)"
    )

    (setq result (start_dialog))

    (unload_dialog dcl_id)

    (if (= result 1)
        (progn

            (AR:DrawBoundary *AR-PlotW* *AR-PlotL*)

            (alert "Boundary Created Successfully.")

        )
    )

    (princ)

)

   (action_tile
 "accept"
 "(setq AR-PlotW (get_tile \"plotw\"))
  (setq AR-PlotL (get_tile \"plotl\"))
  (setq AR-Bed (get_tile \"bed\"))
  (setq AR-Bath (get_tile \"bath\"))
  (setq AR-Kitchen (get_tile \"kitchen\"))
  (done_dialog 1)"
)

    (action_tile
        "cancel"
        "(done_dialog 0)"
    )

    (setq result (start_dialog))
    (if (= result 1)
  (alert
    (strcat
      "Plot : "
      AR-PlotW
      " x "
      AR-PlotL
    )
  )
)

    (if (= result 1)

        (progn

            (setq AR-PlotW
                  (atof (get_tile "plotw")))

            (setq AR-PlotL
                  (atof (get_tile "plotl")))

            (setq AR-Bed
                  (atoi (get_tile "bed")))

            (setq AR-Bath
                  (atoi (get_tile "bath")))

            (setq AR-Kitchen
                  (atoi (get_tile "kitchen")))

            (alert
                (strcat
                    "Plot : "
                    (rtos AR-PlotW 2 2)
                    " x "
                    (rtos AR-PlotL 2 2)
                )
            )

        )

    )

    (unload_dialog dcl_id)

)
(defun c:AIGEN ()

    (if (AR:Init)

        (AR:Launch)

    )

    (princ)

)

(princ "\n======================================")
(princ "\nARAIGEN Loaded Successfully")
(princ "\nCommand : AIGEN")
(princ "\n======================================")
(princ)