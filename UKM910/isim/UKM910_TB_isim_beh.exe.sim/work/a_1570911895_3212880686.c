/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Kishore/Documents/MS/IMTEK/ILIAS/SS 2017/VLSI System Design/Project/code base/UKM910_INTR_HNDL/memory_int.vhd";
extern char *STD_TEXTIO;
extern char *IEEE_P_3564397177;
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3499444699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
void ieee_p_3564397177_sub_3988856810_91900896(char *, char *, char *, char *, char *);


static void work_a_1570911895_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned char t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 2128U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 == 0);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t4 != 0)
        goto LAB9;

LAB10:
LAB3:    t1 = (t0 + 3848);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(54, ng0);

LAB5:    t1 = (t0 + 2696U);
    t5 = std_textio_endfile(t1);
    t6 = (!(t5));
    if (t6 != 0)
        goto LAB6;

LAB8:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 2128U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((int *)t1) = 1;
    goto LAB3;

LAB6:    xsi_set_current_line(55, ng0);
    t7 = (t0 + 3336);
    t8 = (t0 + 2696U);
    t9 = (t0 + 2872U);
    std_textio_readline(STD_TEXTIO, t7, t8, t9);
    xsi_set_current_line(56, ng0);
    t1 = (t0 + 3336);
    t2 = (t0 + 2872U);
    t7 = (t0 + 2248U);
    t8 = *((char **)t7);
    t7 = (t0 + 7548U);
    ieee_p_3564397177_sub_3988856810_91900896(IEEE_P_3564397177, t1, t2, t8, t7);
    xsi_set_current_line(57, ng0);
    t1 = (t0 + 2248U);
    t2 = *((char **)t1);
    t1 = (t0 + 2368U);
    t7 = *((char **)t1);
    t3 = *((int *)t7);
    t10 = (t3 - 0);
    t11 = (t10 * 1);
    t12 = (16U * t11);
    t13 = (0U + t12);
    t1 = (t0 + 3928);
    t8 = (t1 + 56U);
    t9 = *((char **)t8);
    t14 = (t9 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t2, 16U);
    xsi_driver_first_trans_delta(t1, t13, 16U, 0LL);
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 2368U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t10 = (t3 + 1);
    t1 = (t0 + 2368U);
    t7 = *((char **)t1);
    t1 = (t7 + 0);
    *((int *)t1) = t10;
    goto LAB5;

LAB7:;
LAB9:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1672U);
    t7 = *((char **)t2);
    t5 = *((unsigned char *)t7);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 1192U);
    t7 = *((char **)t1);
    t1 = (t0 + 7468U);
    t3 = ieee_std_logic_arith_conv_integer_unsigned(IEEE_P_3499444699, t7, t1);
    t10 = (t3 - 0);
    t11 = (t10 * 1);
    xsi_vhdl_check_range_of_index(0, 2047, 1, t3);
    t12 = (16U * t11);
    t13 = (0 + t12);
    t8 = (t2 + t13);
    t9 = (t0 + 3992);
    t14 = (t9 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t8, 16U);
    xsi_driver_first_trans_fast_port(t9);

LAB12:    goto LAB3;

LAB11:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1352U);
    t8 = *((char **)t2);
    t2 = (t0 + 1192U);
    t9 = *((char **)t2);
    t2 = (t0 + 7468U);
    t3 = ieee_std_logic_arith_conv_integer_unsigned(IEEE_P_3499444699, t9, t2);
    t10 = (t3 - 0);
    t11 = (t10 * 1);
    t12 = (16U * t11);
    t13 = (0U + t12);
    t14 = (t0 + 3928);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t8, 16U);
    xsi_driver_first_trans_delta(t14, t13, 16U, 0LL);
    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 3992);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t14 = *((char **)t9);
    memcpy(t14, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB12;

}


extern void work_a_1570911895_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1570911895_3212880686_p_0};
	xsi_register_didat("work_a_1570911895_3212880686", "isim/UKM910_TB_isim_beh.exe.sim/work/a_1570911895_3212880686.didat");
	xsi_register_executes(pe);
}
