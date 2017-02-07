// ./read_text name_image

#include <sys/time.h>
#include <opencv2/opencv.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>

#include <tesseract/baseapi.h>


using namespace cv;
int main(int argc, char* argv[]){

  std::string name_img = "";

  if (argc == 2) {
    name_img = argv[1];
  }
  else  {
    std::cout << "Usage: ./read_text name_image" << std::endl;
    return 0;
  }

  std::cout << "Using image: " << name_img << std::endl;

  Mat img_ocv = imread(name_img, CV_LOAD_IMAGE_GRAYSCALE );

  // Show image
  imshow("Image",img_ocv);

  // Tesseract
  tesseract::TessBaseAPI tess;
  if( tess.Init(NULL, "eng", tesseract::OEM_DEFAULT))
  {
    fprintf(stderr, "Could not initialize tesseract.\n");
    exit(1);
  }

  tess.SetPageSegMode(tesseract::PSM_AUTO);
  tess.SetVariable("tessedit_char_blacklist", "!?@#$%&*()<>_-+=/:;'\"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");
  tess.SetVariable("tessedit_char_whitelist", "0123456789");
  tess.SetVariable("classify_bln_numeric_mode", "1");
  // tess.SetVariable("language_model_penalty_non_dict_word", "0");

  tess.SetImage((uchar*)img_ocv.data, img_ocv.cols, img_ocv.rows, 1, img_ocv.cols);

  // Get the text
  char* out = tess.GetUTF8Text();
  std::cout << "Result: " << out << std::endl;

  waitKey( 0 );


  return 0;
}
