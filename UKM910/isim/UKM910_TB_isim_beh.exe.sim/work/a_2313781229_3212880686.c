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
static const char *ng0 = "C:/Users/Kishore/Documents/MS/IMTEK/ILIAS/SS 2017/VLSI System Design/Project/code base/UKM910_INTR_HNDL/remote_sources/_/UKM910_ALU_Design/LogicalShifter_16Bit.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1830103426_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_2770553711_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_3077134611_1035706684(char *, char *, char *, char *, int );


static void work_a_2313781229_3212880686_p_0(char *t0)
{
    char t6[16];
    char t11[16];
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;

LAB0:    xsi_set_current_line(45, ng0);

LAB3:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 1352U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t7 = ((IEEE_P_2592010699) + 4024);
    t1 = xsi_base_array_concat(t1, t6, t7, (char)99, t3, (char)99, t5, (char)101);
    t8 = (t0 + 1512U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t12 = ((IEEE_P_2592010699) + 4024);
    t8 = xsi_base_array_concat(t8, t11, t12, (char)97, t1, t6, (char)99, t10, (char)101);
    t13 = (1U + 1U);
    t14 = (t13 + 1U);
    t15 = (3U != t14);
    if (t15 == 1)
        goto LAB5;

LAB6:    t16 = (t0 + 4080);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t8, 3U);
    xsi_driver_first_trans_fast(t16);

LAB2:    t21 = (t0 + 3968);
    *((int *)t21) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(3U, t14, 0);
    goto LAB6;

}

static void work_a_2313781229_3212880686_p_1(char *t0)
{
    char t14[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned char t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 7654);
    t4 = xsi_mem_cmp(t1, t2, 3U);
    if (t4 == 1)
        goto LAB3;

LAB8:    t5 = (t0 + 7657);
    t7 = xsi_mem_cmp(t5, t2, 3U);
    if (t7 == 1)
        goto LAB4;

LAB9:    t8 = (t0 + 7660);
    t10 = xsi_mem_cmp(t8, t2, 3U);
    if (t10 == 1)
        goto LAB5;

LAB10:    t11 = (t0 + 7663);
    t13 = xsi_mem_cmp(t11, t2, 3U);
    if (t13 == 1)
        goto LAB6;

LAB11:
LAB7:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4144);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t1);

LAB2:    t1 = (t0 + 3984);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(52, ng0);
    t15 = (t0 + 1032U);
    t16 = *((char **)t15);
    t15 = (t0 + 7544U);
    t17 = ieee_p_1242562249_sub_1830103426_1035706684(IEEE_P_1242562249, t14, t16, t15, 1);
    t18 = (t14 + 12U);
    t19 = *((unsigned int *)t18);
    t19 = (t19 * 1U);
    t20 = (16U != t19);
    if (t20 == 1)
        goto LAB13;

LAB14:    t21 = (t0 + 4144);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t17, 16U);
    xsi_driver_first_trans_fast(t21);
    goto LAB2;

LAB4:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 7544U);
    t3 = ieee_p_1242562249_sub_2770553711_1035706684(IEEE_P_1242562249, t14, t2, t1, 1);
    t5 = (t14 + 12U);
    t19 = *((unsigned int *)t5);
    t19 = (t19 * 1U);
    t20 = (16U != t19);
    if (t20 == 1)
        goto LAB15;

LAB16:    t6 = (t0 + 4144);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 16U);
    xsi_driver_first_trans_fast(t6);
    goto LAB2;

LAB5:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 7544U);
    t3 = ieee_p_1242562249_sub_3077134611_1035706684(IEEE_P_1242562249, t14, t2, t1, 1);
    t5 = (t14 + 12U);
    t19 = *((unsigned int *)t5);
    t19 = (t19 * 1U);
    t20 = (16U != t19);
    if (t20 == 1)
        goto LAB17;

LAB18:    t6 = (t0 + 4144);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 16U);
    xsi_driver_first_trans_fast(t6);
    goto LAB2;

LAB6:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 7544U);
    t3 = ieee_p_1242562249_sub_3077134611_1035706684(IEEE_P_1242562249, t14, t2, t1, 1);
    t5 = (t14 + 12U);
    t19 = *((unsigned int *)t5);
    t19 = (t19 * 1U);
    t20 = (16U != t19);
    if (t20 == 1)
        goto LAB19;

LAB20:    t6 = (t0 + 4144);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 16U);
    xsi_driver_first_trans_fast(t6);
    goto LAB2;

LAB12:;
LAB13:    xsi_size_not_matching(16U, t19, 0);
    goto LAB14;

LAB15:    xsi_size_not_matching(16U, t19, 0);
    goto LAB16;

LAB17:    xsi_size_not_matching(16U, t19, 0);
    goto LAB18;

LAB19:    xsi_size_not_matching(16U, t19, 0);
    goto LAB20;

}

static void work_a_2313781229_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(60, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 4208);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4000);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2313781229_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2313781229_3212880686_p_0,(void *)work_a_2313781229_3212880686_p_1,(void *)work_a_2313781229_3212880686_p_2};
	xsi_register_didat("work_a_2313781229_3212880686", "isim/UKM910_TB_isim_beh.exe.sim/work/a_2313781229_3212880686.didat");
	xsi_register_executes(pe);
}
