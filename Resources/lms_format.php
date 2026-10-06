<?php

if (!function_exists('format_lms_amount')) {
    /**
     * Display monetary amounts as whole numbers (no decimal places).
     */
    function format_lms_amount($amount, bool $blankIfZero = false): string
    {
        if ($amount === null || $amount === '') {
            return $blankIfZero ? '' : '0';
        }
        $value = (float) $amount;
        if ($blankIfZero && abs($value) < 0.0000001) {
            return '';
        }
        return number_format((int) round($value), 0, '.', ',');
    }
}
