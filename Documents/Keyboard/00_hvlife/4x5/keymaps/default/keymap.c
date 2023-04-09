#include QMK_KEYBOARD_H



const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    /* Base (qwerty)
    */
    [0] = LAYOUT(
        KC_Q,    KC_W,    KC_F,    KC_P,    KC_B,                                         KC_J,    KC_L,    KC_U,    KC_Y,    KC_EXLM,
        KC_A,    KC_R,    KC_S,    KC_T,    KC_G,                                         KC_M,    KC_N,    KC_E,    KC_I,    KC_O,
        KC_Z,    KC_X,    KC_C,    KC_D,    KC_V,                                         KC_K,    KC_H,    KC_COMM, KC_DOT,  KC_QUES,
                 KC_ESC,  KC_TAB,                                                                           KC_HOME, KC_END,
                                   RALT_T(KC_ENT), KC_LSFT,                      KC_BSPC, LCTL_T(KC_SPC),
                                              TO(0), TO(1), KC_LGUI,     KC_DEL, TO(2), TO(3)
    ),

    /* 1
    */
    [1] = LAYOUT(
        KC_LCBR, KC_RCBR, KC_PEQL, KC_MINS, KC_PLUS,                                      KC_GRV,  KC_7,    KC_8,    KC_9,    KC_0,
        KC_LPRN, KC_RPRN, KC_DLR,  KC_CIRC, KC_ASTR,                                      KC_COLN, KC_4,    KC_5,    KC_6,    KC_QUOT,
        KC_LBRC, KC_RBRC, KC_UNDS, KC_TILD, KC_PERC,                                      KC_SCLN, KC_1,    KC_2,    KC_3,    KC_DQUO,
                 KC_AT,   KC_HASH,                                                                          KC_COMM, KC_DOT,
                                   KC_AMPR, KC_TRNS,                                    KC_PSLS, KC_PIPE,
                                   KC_TRNS, KC_TRNS, KC_TRNS,                  KC_BSLS, KC_TRNS, KC_TRNS
    ),

    /* 2
    */
    [2] = LAYOUT(
        KC_NO,   KC_HOME, KC_END,  KC_NO,   KC_PSCR,                                      KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
        KC_LEFT, KC_UP,   KC_DOWN, KC_RGHT, KC_NO,                                        KC_NO,   KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R,
        KC_NO,   KC_PGUP, KC_PGDN, KC_NO,   KC_NO,                                        KC_NO,   KC_WH_L, KC_WH_D, KC_WH_U, KC_WH_R,
                 KC_NO,   KC_NO,                                                                            KC_BTN4, KC_BTN5,
                                   KC_ENT, KC_TRNS,                                     KC_BTN2, KC_BTN1,
                                   KC_TRNS, KC_TRNS, KC_TRNS,                  KC_BTN3, KC_TRNS, KC_TRNS
    ),

    /* 3
    */
    [3] = LAYOUT(
        KC_NO,   KC_Q,    KC_E,    KC_R,    KC_NO,                                        KC_NO,   KC_NO,   KC_NO,  KC_NO,   KC_NO,
        KC_A,    KC_W,    KC_S,    KC_D,    KC_NO,                                        KC_NO,   KC_LEFT, KC_DOWN,KC_UP,   KC_RGHT,
        KC_NO,   KC_M,    KC_TAB,  KC_F,    KC_NO,                                        KC_NO,   KC_NO,   KC_NO, KC_NO,   KC_NO,
                 KC_ESC,  KC_NO,                                                                   KC_NO,   KC_NO,
                                   KC_SPC,  KC_LSFT,                                    KC_NO, KC_ENT,
                                   KC_TRNS, KC_TRNS, KC_LCTL,                 KC_NO,  KC_TRNS, KC_TRNS
    ),

};

void persistent_default_layer_set(uint16_t default_layer) {
    eeconfig_update_default_layer(default_layer);
default_layer_set(default_layer);
}
