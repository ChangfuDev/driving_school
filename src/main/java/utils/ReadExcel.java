package utils;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import entity.Enroll;
public class ReadExcel {
	//������
    private int totalRows = 0;  
    //������
    private int totalCells = 0; 
    //������Ϣ������
    private String errorMsg;
    //���췽��
    public ReadExcel(){}
    //��ȡ������
    public int getTotalRows()  { return totalRows;} 
    //��ȡ������
    public int getTotalCells() {  return totalCells;} 
    //��ȡ������Ϣ
    public String getErrorInfo() { return errorMsg; }    
  /**
   * ��EXCEL�ļ�����ȡ��Ϣ����
   * @param fielName
   * @return
   */
	public List<Enroll> getExcelInfo(MultipartFile mFile) {
		String fileName = mFile.getOriginalFilename();//��ȡ�ļ���
		System.out.println("�ļ���"+fileName);
		List<Enroll> enList = null;
		try {
			if (!validateExcel(fileName)) {// ��֤�ļ����Ƿ�ϸ�
				return null;
			}
			boolean isExcel2003 = true;// �����ļ����ж��ļ���2003�汾����2007�汾
			if (isExcel2007(fileName)) {
				isExcel2003 = false;
			}
			enList = createExcel(mFile.getInputStream(), isExcel2003);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return enList;
	}
  /**
   * ����excel��������ݶ�ȡ�ͻ���Ϣ
   * @param is ������
   * @param isExcel2003 excel��2003����2007�汾
   * @return
   * @throws IOException
   */
	public List<Enroll> createExcel(InputStream is, boolean isExcel2003) {
		List<Enroll> stuList = null;
		try{
			Workbook wb = null;
			if (isExcel2003) {// ��excel��2003ʱ,����excel2003
				wb = new HSSFWorkbook(is);
			} else {// ��excel��2007ʱ,����excel2007
				wb = new XSSFWorkbook(is);
			}
			 stuList = readExcelValue(wb);// ��ȡExcel����ͻ�����Ϣ
		} catch (IOException e) {
			e.printStackTrace();
		}
		return stuList;
	}  
  /**
   * ��ȡExcel����ͻ�����Ϣ
   * @param wb
   * @return
   */
	private List<Enroll> readExcelValue(Workbook wb) {
		// �õ���һ��shell
		Sheet sheet = wb.getSheetAt(0);
		System.out.println("gaolei dayin============" +sheet);
		// �õ�Excel������
		this.totalRows = sheet.getPhysicalNumberOfRows();
		System.out.println("����======="+this.totalRows);
		// �õ�Excel������(ǰ����������)
		if (totalRows > 1 && sheet.getRow(0) != null) {
			this.totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
			System.out.println("������=========="+this.totalCells);
		}
		List<Enroll> enList = new ArrayList<Enroll>();
		// ѭ��Excel����
		for (int r = 1; r < totalRows; r++) {
			Row row = sheet.getRow(r);
			if (row == null){
				continue;
			}
			Enroll enroll = new Enroll();
			// ѭ��Excel����
			for (int c = 0; c < this.totalCells; c++) {
				Cell cell = row.getCell(c);
				if (null != cell) {
					if (c == 0) {
						if(cell.getCellType() == HSSFCell.CELL_TYPE_STRING){
							enroll.setEnName(String.valueOf(cell.getStringCellValue()));
						}
					} else if (c == 1) {
						if(cell.getCellType() == HSSFCell.CELL_TYPE_STRING){
							enroll.setEnIcard(String.valueOf(cell.getStringCellValue()));
						}
					} 
					else if (c == 2){
						if(cell.getCellType() == HSSFCell.CELL_TYPE_STRING){
							enroll.setEnSub(String.valueOf(cell.getStringCellValue()));
						}
					}
					else if (c == 3){  
						if(cell.getCellType() == HSSFCell.CELL_TYPE_STRING){
							enroll.setEnDate(String.valueOf(cell.getStringCellValue()));
						}
					}
					
				}
			}
			// ��ӵ�list
			enList.add(enroll);
		}
		return enList;
	}
	
	/**
	 * ��֤EXCEL�ļ�
	 * 
	 * @param filePath
	 * @return
	 */
	public boolean validateExcel(String filePath) {
		if (filePath == null || !(isExcel2003(filePath) || isExcel2007(filePath))) {
			errorMsg = "�ļ�������excel��ʽ";
			return false;
		}
		return true;
	}
	
	// @�������Ƿ���2003��excel������true��2003 
    public static boolean isExcel2003(String filePath)  {  
         return filePath.matches("^.+\\.(?i)(xls)$");  
     }  
    //@�������Ƿ���2007��excel������true��2007 
    public static boolean isExcel2007(String filePath)  {  
         return filePath.matches("^.+\\.(?i)(xlsx)$");  
     }  
}
