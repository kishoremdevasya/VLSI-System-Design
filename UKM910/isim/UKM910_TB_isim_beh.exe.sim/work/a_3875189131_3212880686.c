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
static const char *ng0 = "C:/Users/Kishore/Documents/MS/IMTEK/ILIAS/SS 2017/VLSI System Design/Project/code base/UKM910_INTR_HNDL/MUX_2to1_16Bits.vhd";



static void work_a_3875189131_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    static char *nl0[] = {&&LAB4, &&LAB4, &&LAB3, &&LAB4, &&LAB4, &&LAB4, &&LAB4, &&LAB4, &&LAB4};

LAB0:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t3);
    goto **((char **)t1);

LAB2:    t1 = (t0 + 2992);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(44, ng0);
    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t4 = (t0 + 3072);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 16U);
    xsi_driver_first_trans_fast_port(t4);
    goto LAB2;

LAB4:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 3072);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

}


extern void work_a_3875189131_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3875189131_3212880686_p_0};
	xsi_register_didat("work_a_3875189131_3212880686", "isim/UKM910_TB_isim_beh.exe.sim/work/a_3875189131_3212880686.didat");
	xsi_register_executes(pe);
}
