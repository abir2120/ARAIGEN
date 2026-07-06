//==================================================
// ARAIGEN V0.1
// Block 2.1
//==================================================

araigen : dialog {

    label = "ARAIGEN V0.1";

    : column {

        : boxed_column {

            label = "Project Information";

            : row {

                : edit_box {
                    key = "plot_width";
                    label = "Plot Width (ft)";
                    edit_width = 10;
                    value = "24";
                }

                : edit_box {
                    key = "plot_length";
                    label = "Plot Length (ft)";
                    edit_width = 10;
                    value = "45";
                }

            }

            : row {

                : edit_box {
                    key = "bedroom";
                    label = "Bedroom";
                    edit_width = 5;
                    value = "3";
                }

                : edit_box {
                    key = "bathroom";
                    label = "Bathroom";
                    edit_width = 5;
                    value = "2";
                }

            }

            : row {

                : edit_box {
                    key = "kitchen";
                    label = "Kitchen";
                    edit_width = 5;
                    value = "1";
                }

                : edit_box {
                    key = "drawing";
                    label = "Drawing";
                    edit_width = 5;
                    value = "1";
                }

            }

            : row {

                : edit_box {
                    key = "dining";
                    label = "Dining";
                    edit_width = 5;
                    value = "1";
                }

                : popup_list {
                    key = "stair";
                    label = "Stair";
                }

            }

        }

        spacer;

        ok_cancel;

    }

}