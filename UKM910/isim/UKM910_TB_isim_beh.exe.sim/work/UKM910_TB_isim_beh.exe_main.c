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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *IEEE_P_3564397177;
char *STD_TEXTIO;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    ieee_p_1242562249_init();
    work_a_3345071534_3212880686_init();
    work_a_4015443957_3212880686_init();
    work_a_0748751209_3212880686_init();
    work_a_2204111684_3212880686_init();
    work_a_1868983810_3212880686_init();
    work_a_0969856948_3212880686_init();
    work_a_0363328289_1181938964_init();
    work_a_3947230167_3212880686_init();
    work_a_2313781229_3212880686_init();
    work_a_0832606739_1181938964_init();
    work_a_3853510154_3212880686_init();
    work_a_4008160278_3212880686_init();
    work_a_2818097207_3212880686_init();
    work_a_3875189131_3212880686_init();
    work_a_0214511185_3212880686_init();
    work_a_1532412009_3212880686_init();
    work_a_0085242164_3212880686_init();
    work_a_2616175359_3212880686_init();
    work_a_3668199810_3212880686_init();
    work_a_3047348489_3212880686_init();
    work_a_4068729397_1181938964_init();
    std_textio_init();
    ieee_p_3564397177_init();
    work_a_1570911895_3212880686_init();
    work_a_3392787015_3212880686_init();
    work_a_2976336880_2372691052_init();


    xsi_register_tops("work_a_2976336880_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");

    return xsi_run_simulation(argc, argv);

}
