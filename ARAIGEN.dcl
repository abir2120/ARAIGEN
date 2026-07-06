//=====================================================
// ARAIGEN V0.1
//=====================================================

araigen : dialog {

    label = "ARAIGEN V0.1";

    : column {

        : boxed_column {

            label = "Project";

            : edit_box {
                key="plotw";
                label="Plot Width";
                value="24";
                edit_width=8;
            }

            : edit_box {
                key="plotl";
                label="Plot Length";
                value="45";
                edit_width=8;
            }

            : edit_box {
                key="bed";
                label="Bedrooms";
                value="3";
                edit_width=8;
            }

            : edit_box {
                key="bath";
                label="Bathrooms";
                value="2";
                edit_width=8;
            }

            : edit_box {
                key="kitchen";
                label="Kitchen";
                value="1";
                edit_width=8;
            }

        }

        spacer;

        ok_cancel;

    }

}