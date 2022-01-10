import string,sys,os,glob

def STEP1_count(LIBRARY,result,GROUP):
    sample =  ','.join(result)
    os.system('mageck count -l '+LIBRARY+' -n '+GROUP+' --sample-label '+sample +' --fastq '+' '.join(map(lambda z:z, result)))

def STEP2_MAGECK(GROUP,T,C):
    os.system('mageck test -k '+GROUP+'.count.txt -t '+','.join(map(lambda z:z, T))+' -c '+','.join(map(lambda z:z, C))+' -n '+GROUP+' --pdf-report')

def main():
    LIBRARY = './sgRNA_library.txt'
    file_list = os.listdir('./')
    group = [['group1_','group2_'],['group1_','group3_'],['group2_','group3_']]
    for i in group:
        CHR = []
        for j in i:
            f_list = [file for file in file_list if file.startswith(j)]
            if not f_list in CHR:CHR.append(f_list)
        result = sum(CHR, [])    # ['group1_04.fastq.gz', 'group1_08.fastq.gz', 'group2_20.fastq.gz', 'group2_02.fastq.gz', 'group3_03.fastq.gz', 'group3_21.fastq.gz']

        T,C = CHR[0],CHR[1]
        #['group1_04.fastq.gz', 'group1_08.fastq.gz']
        #['group2_20.fastq.gz', 'group2_02.fastq.gz']
        GROUP =  T[0].split('.fastq.gz')[0][:-3]+':'+C[0].split('.fastq.gz')[0][:-3]

        STEP1_count(LIBRARY,result,GROUP)
        STEP2_MAGECK(GROUP,T,C)
main()

