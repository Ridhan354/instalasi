#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY����  �_�Tp}���~�ގ����  D   � P @�U��CSBi�!���� ��M=FM ��A�?R 4E6ML��M��#M4h �@  A�CM@�h`�2h�� 	"ML�4F�S� ��Q���1!����4( ���9�.��aUN��:qE2pBt�]���'y�fj��,]o�4�o������עz��0��9m�Jx]�Aԗ��6+�l�����A�e��e-��`̭"�5�Kp{
�Z�Ñ�ɧ�X����CX�k[�Sp�֥�T�#6'�UV���"A��2�T�WE���F輋7�������F7;$���}� u��B� ����Ni�����DU0=l�L�:X.�b�����*�$�T�CrZ�j���!~䑞�+�1�uX$�Jo�Y�_��ͧ�@D��p:`s���o����,v�(��*9�3�)[w8	̠CEkkPPH;c��F��ѝaf�!�e�V�P����av���We4;+nX�D�a_ ��;ɁXDe
H���1&L��%��)ς�P2\U�tt�S�ۘ��faa<r���U[�wi[����%!�&ā�N�&�1*����z�`���K}a~��֝�5v�IY���3�����e��3��,���#f*�|)�ca�=�;ָ`=��P��B��*Y�+��P���a�ʹPl]���Yi�C�fJf"`)%3�Iٝ�Ʒ�L)��+g%�-<�(��2Ӻ�_�D��Z�R�P)	��$��d0�dP���x���`Ce�@�[N<5F��� e`_B@������%1�9�t��.$��w$S�	���