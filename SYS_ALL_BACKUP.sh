############################################################################
# 서비스 프로세스 로그 백업 스크립트 - 2021.04.23 -BY JWJUNG                  #
# - ONLINE                                                                 #
# - WEB                                                                    #
# - BATCH                                                                  #
# - ETC                                                                    #
############################################################################

############################################################################
##     #######    ##      ##  ##        ########  ##      ##  ########    ##
##    ##      #   ###     ##  ##           ##     ###     ##  #           ##
##   ##       ##  ####    ##  ##           ##     ####    ##  #           ##
##   ##       ##  ##  #   ##  ##           ##     ##  #   ##  ########    ##
##   ##       ##  ##   #  ##  ##           ##     ##   #  ##  #           ##
##    ##     ##   ##    # ##  ##           ##     ##    # ##  #           ##
##     #######    ##     ###  ########  ########  ##     ###  ########    ##
############################################################################

############################################################################
# 모바일 티머니 2 후불  로그 백업 - MT_ATXN 
############################################################################ 
cd /webstore/logs/MT_ATXN
find /webstore/logs/MT_ATXN -mtime +2 -type f -exec mv '{}' /webstore/data/MOBILE/MT_ATXN \;
cd /webstore/data/MOBILE/MT_ATXN
find /webstore/data/MOBILE/MT_ATXN ! -name "*gz" -type f  -exec gzip '{}' \;
############################################################################

############################################################################
# 외부 티코인 관리자 페이지 로그 백업 - web_tcoin 
############################################################################ 
cd /webstore/logs/tcoin
find /webstore/logs/tcoin -mtime +2 -type f -exec mv '{}' /webstore/data/MOBILE/web_tcoin \;
cd /webstore/pub/tcoin/logs
find /webstore/pub/tcoin/logs -mtime +2 -type f -exec mv '{}' /webstore/data/MOBILE/web_tcoin \;
cd /webstore/data/MOBILE/web_tcoin
find /webstore/data/MOBILE/web_tcoin ! -name "*gz" -type f  -exec gzip '{}' \;
############################################################################

############################################################################
# batch Log - Log Backup
############################################################################
CDATE=`date +%Y%m%d`
cd /appstore/tmonet/batch/logs
find /appstore/tmonet/batch/logs -mtime +2 -type f   -exec gzip '{}' \;
touch batch_"$CDATE"_05.tar
find /appstore/tmonet/batch/logs -mtime +2 -type f  -exec tar -rvf batch_"$CDATE"_05.tar '{}' \;
mv batch_"$CDATE"_05.tar /webstore/data/MOBILE/batch_log/
find /appstore/tmonet/batch/logs -mtime +2 -type f  -exec rm -rf '{}' \;
############################################################################ 

############################################################################
# Resource - 자원관리로그
############################################################################
CDATE=`date +%Y%m%d`
cd /webstore/logs/Resource
find /webstore/logs/Resource -mtime +5 -type f -exec  gzip '{}' \;
touch TWAS1_Resource_$CDATE.tar
find /webstore/logs/Resource -mtime +5 -type f -exec tar -rvf /webstore/logs/Resource/TWAS1_Resource_$CDATE.tar '{}' \;
mv /webstore/logs/Resource/TWAS1_Resource_$CDATE.tar /webstore/data/MOBILE/Resource/
find /webstore/logs/Resource -mtime +5 -type f -exec  rm -rf '{}' \;
############################################################################

############################################################################
# LGUplus 서버 로그 백업 2021.04.23
############################################################################
cd /webstore/logs/LGUplus
find /webstore/logs/LGUplus -type d -mtime +2 -exec tar -czvf "{}.tar.gz" "{}" \;
mv /webstore/logs/LGUplus/*.tar.gz /webstore/data/MOBILE/LGUplus
find /webstore/logs/LGUplus -mindepth 1 -maxdepth 1 -mtime +2 -type d -exec rm -rf {} \;
############################################################################

############################################################################
# EASYSIGN APACHE 서버 로그 백업 2021.04.22
############################################################################
cd /webstore/logs/EASYSIGN
find /webstore/logs/EASYSIGN -mtime +2 -type f -exec mv '{}' /webstore/data/MOBILE/EASYSIGN \;
cd /webstore/data/MOBILE/EASYSIGN
find /webstore/data/MOBILE/EASYSIGN ! -name "*gz" -type f  -exec gzip '{}' \;
############################################################################
