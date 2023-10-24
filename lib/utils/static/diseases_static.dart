import 'package:flower_prediction/models/disease_model.dart';
import 'package:flower_prediction/models/treatman_plan_model.dart';

List<DiseaseModel> diseaseStatic = [
  DiseaseModel(
    key: "Black_rot_Stage_1",
    disease: "Black Rot Stage 1",
    description:
        "Black rot disease, at its initial stage, presents as subtle but crucial symptoms on various plants, primarily affecting cruciferous vegetables such as cabbage, broccoli, and kale. In stage 1, infected plants display small, dark spots or lesions on their leaves, resembling tiny black specks. These spots are the first signs of trouble and can easily be overlooked. However, they mark the beginning of a potentially devastating disease that, if left unchecked, can lead to extensive damage and loss in agricultural crops. Early detection and intervention are essential in managing black rot disease and preserving crop health.",
    description2:
        "Remember that the effectiveness of these treatments may vary depending on the severity of the disease and your specific growing conditions. If the disease progresses beyond Stage 1 or becomes unmanageable, consult with a local agricultural extension office or a plant disease specialist for further guidance and potential chemical control options.",
    treatmentPlan: {
      0: TreatmentPlan(
        plan: "Isolation",
        desc:
            "Immediately identify and isolate infected plants. Remove and destroy any plants showing symptoms of black rot to prevent the spread of the disease to healthy plants",
      ),
      1: TreatmentPlan(
        plan: "Pruning",
        desc:
            "Prune affected leaves and stems well below the visible lesions. Ensure that you disinfect your pruning tools between cuts to avoid further contamination",
      ),
      2: TreatmentPlan(
        plan: "Sanitation",
        desc:
            "Maintain good garden hygiene. Remove and destroy any fallen leaves or plant debris to reduce the pathogen's overwintering potential. Keep the area around your plants clean and free from weeds that may harbor the disease",
      ),
      3: TreatmentPlan(
        plan: "Water Management",
        desc:
            "Avoid overhead watering, as moisture on the leaves can promote disease development. Instead, use a drip irrigation system or water at the base of the plants early in the day, allowing time for the foliage to dry before evening",
      ),
      4: TreatmentPlan(
        plan: "Copper-based Fungicides",
        desc:
            "Apply copper-based fungicides as a preventative measure to protect healthy plants from infection. Follow the manufacturer's recommendations for application rates and timing",
      ),
      5: TreatmentPlan(
        plan: "Crop Rotation",
        desc:
            "Practice crop rotation to reduce the likelihood of the disease recurring in the same area. Avoid planting cruciferous crops in the same location for at least two to three years",
      ),
      6: TreatmentPlan(
        plan: "Resistant Varieties",
        desc:
            "If available, consider planting black rot-resistant varieties of cruciferous crops in your garden",
      ),
      7: TreatmentPlan(
        plan: "Monitor",
        desc:
            "Regularly inspect your plants for any signs of new infections. Early detection is key to preventing the disease from spreading",
      ),
      8: TreatmentPlan(
        plan: "Healthy Soil",
        desc:
            "Ensure that your soil is well-drained and rich in organic matter to promote plant health and resistance to disease",
      ),
      9: TreatmentPlan(
        plan: "Educate Yourself",
        desc:
            "Continuously educate yourself about black rot and its management. Local agricultural extension services or gardening clubs can provide valuable information specific to your region",
      ),
    },
  ),
  DiseaseModel(
    key: "Black_rot_Stage_2",
    disease: "Black Rot Stage 2",
    description:
        "In the second stage of black rot disease, the situation intensifies as the initial small black spots on the plant leaves expand and develop a characteristic V-shaped pattern. These lesions extend deeper into the leaf tissue, turning brown and causing the affected areas to wither and die. As the disease progresses, the leaves become increasingly brittle and susceptible to breakage. At this point, it becomes more evident that black rot can have a significant impact on crop yield, making timely and effective management measures even more critical to mitigate its devastating effects. A treatment plan for black rot disease at stage 2 involves a combination of cultural, chemical, and preventive measures to manage the disease and protect your crops",
    description2:
        "Remember that early intervention is critical in managing black rot disease effectively. Implementing these measures in stage 2 can help control the disease's spread and minimize its impact on your crops.",
    treatmentPlan: {
      0: TreatmentPlan(
        plan: "Prune Affected Leaves",
        desc:
            "Begin by removing and destroying (do not compost) all leaves and plant material showing symptoms of black rot. This helps reduce the disease's spread",
      ),
      1: TreatmentPlan(
        plan: "Sanitation",
        desc:
            "Keep the planting area clean and free from plant debris, as the pathogen can survive on fallen leaves and other plant materials",
      ),
      2: TreatmentPlan(
        plan: "Crop Rotation",
        desc:
            "Avoid planting cruciferous crops in the same location for several years to break the disease cycle.",
      ),
      3: TreatmentPlan(
        plan: "Plant Resistant Varieties",
        desc:
            "Whenever possible, select plant varieties that are resistant to black rot.",
      ),
      4: TreatmentPlan(
        plan: "Fungicides",
        desc:
            "Consider using fungicides labeled for black rot control. Follow the manufacturer's instructions for application and safety precautions.",
      ),
      5: TreatmentPlan(
        plan: "Spacing and Pruning",
        desc:
            "Properly space plants to allow for good air circulation, and prune to reduce leaf density, which can slow the disease's spread.",
      ),
      6: TreatmentPlan(
        plan: "Water Management",
        desc:
            "Water at the base of the plants to prevent moisture on the leaves. Overhead irrigation can encourage disease spread.",
      ),
      7: TreatmentPlan(
        plan: "Soil Health",
        desc:
            "Ensure proper soil drainage and maintain optimal soil pH for your crops. Healthy plants are better equipped to resist disease.",
      ),
      8: TreatmentPlan(
        plan: "Crop Monitoring",
        desc:
            "Regularly inspect plants for any signs of new infections, and take action promptly if you notice symptoms.",
      ),
      9: TreatmentPlan(
        plan: "Consult with Local Experts",
        desc:
            "Reach out to local agricultural extension services or experts for advice specific to your region, as the severity and timing of black rot can vary based on local conditions.",
      ),
    },
  ),
  DiseaseModel(
    key: "Scab_leaf_disease_Stage_1",
    disease: "Blight leaf disease stage 1",
    description:
        "In the first stage of scab leaf disease, early symptoms become visible. Infected leaves display small, superficial lesions or scabs, often with a velvety or powdery appearance, which give the disease its name. These lesions might be slightly discolored and do not yet significantly harm the overall health of the tree. Stage 1 is a crucial early detection point, signaling the need for vigilant orchard management to prevent the disease from advancing and causing more severe damage to the flowers and leaves.",
    description2: "",
    treatmentPlan: {
      0: TreatmentPlan(
        plan: "Prune and Remove Affected Leaves",
        desc:
            "Begin by carefully pruning and removing leaves showing early scab symptoms. Make sure to dispose of the infected leaves properly, as they can harbor the pathogen.",
      ),
      1: TreatmentPlan(
        plan: "Sanitation",
        desc:
            "Maintain good orchard hygiene by regularly cleaning up fallen leaves and debris, as scab spores can overwinter on these materials.",
      ),
      2: TreatmentPlan(
        plan: "Fungicide Application",
        desc:
            "Consider applying a preventive fungicide treatment in the spring before the disease becomes more severe. Consult with a local agricultural extension service or expert to determine the most appropriate fungicide and application timing for your region and tree variety.",
      ),
      3: TreatmentPlan(
        plan: "Proper Pruning",
        desc:
            "Ensure good air circulation within the canopy through selective pruning. Pruning encourages faster leaf drying, making it less favorable for the disease.",
      ),
      4: TreatmentPlan(
        plan: "Mulch and Weed Control",
        desc:
            "Apply mulch around the base of the trees to prevent soil splashing onto the leaves, which can spread the disease. Keep the orchard area weed-free to reduce the risk of scab spores harboring in nearby plants.",
      ),
      5: TreatmentPlan(
        plan: "Timely Watering",
        desc:
            "Water your fruit trees at the base rather than overhead to minimize leaf wetness, which can contribute to disease development.",
      ),
      6: TreatmentPlan(
        plan: "Varietal Resistance",
        desc:
            "If possible, consider planting or grafting scab-resistant fruit tree varieties, as they are less susceptible to the disease.",
      ),
      7: TreatmentPlan(
        plan: "Monitor and Scout",
        desc:
            "Regularly inspect your trees for any signs of new infections. Early detection allows for prompt action.",
      ),
      8: TreatmentPlan(
        plan: "Record Keeping",
        desc:
            "Maintain records of disease incidence and treatment schedules, which can help in planning for future seasons.",
      ),
      9: TreatmentPlan(
        plan: "Consult Experts",
        desc:
            "Seek guidance from local horticultural experts or agricultural extension services for advice specific to your region and tree type.",
      ),
    },
  ),
  DiseaseModel(
    key: "Scab_leaf_disease_Stage_2",
    disease: "Scab leaf disease Stage 2",
    description:
        "In the second stage of scab leaf disease, the symptoms become more pronounced and concerning. Infected leaves exhibit larger and more numerous lesions with a raised, scaly texture. The scabs often take on a dark, olive-green or black appearance, creating a distinctive and unsightly pattern. At this stage, the disease may spread to nearby fruit, increasing the risk of reduced fruit quality and yield. Timely intervention is critical to prevent further escalation of the disease, emphasizing the importance of effective management strategies in scab leaf disease control.",
    description2: "",
    treatmentPlan: {
      0: TreatmentPlan(
        plan: "Prune and Remove Affected Leaves",
        desc:
            "Continue to prune and remove leaves with advanced scab symptoms. Be thorough in your removal to reduce the disease's source of spores.",
      ),
      1: TreatmentPlan(
        plan: "Sanitation",
        desc:
            "Maintain a clean orchard environment by collecting and disposing of fallen leaves and any other infected plant material.",
      ),
      2: TreatmentPlan(
        plan: "Fungicide Application",
        desc:
            "Apply fungicides labeled for scab control following a recommended schedule and dosage. Consult with local experts for specific recommendations based on your region and tree variety.",
      ),
      3: TreatmentPlan(
        plan: "Fruit Thinning",
        desc:
            "To reduce disease pressure on the fruit, consider thinning the fruit clusters, allowing better air circulation and quicker drying of leaves.",
      ),
      4: TreatmentPlan(
        plan: "Proper Pruning",
        desc:
            "Continue with selective pruning to improve canopy air circulation, as well as remove branches that are heavily affected by the disease.",
      ),
      5: TreatmentPlan(
        plan: "Mulch and Weed Control",
        desc:
            "Maintain mulch around the base of trees and continue to control weeds to prevent soil splashing and minimize the risk of spore transfer.",
      ),
      6: TreatmentPlan(
        plan: "Monitor and Scout",
        desc:
            "Regularly inspect the orchard for new infections, and remove affected leaves and fruit promptly.",
      ),
      7: TreatmentPlan(
        plan: "Record Keeping",
        desc:
            "Keep detailed records of disease management efforts, including fungicide applications and their effectiveness.",
      ),
      8: TreatmentPlan(
        plan: "Post-Harvest Cleanup",
        desc:
            "After harvest, ensure thorough orchard cleanup to remove any remaining infected debris.",
      ),
      9: TreatmentPlan(
        plan: "Varietal Selection",
        desc:
            "Consider planting or grafting scab-resistant varieties for future planting to reduce the risk of disease.",
      ),
      10: TreatmentPlan(
        plan: "Consult with Experts",
        desc:
            "Seek advice from local agricultural extension services or horticultural experts for guidance tailored to your specific conditions.",
      ),
    },
  ),
  DiseaseModel(
    key: "Blight_leaf_disease_stage_1",
    disease: "Blight leaf disease stage 1",
    description:
        "In the initial stage of blight leaf disease, subtle symptoms start to appear on plant leaves, typically affecting a wide range of crops, including tomatoes and potatoes. Early signs include small, water-soaked lesions or spots that are often brown or black in color and can be mistaken for various other leaf diseases. At this stage, the overall plant health remains relatively unaffected, but it serves as a critical warning sign for vigilant gardeners and farmers. Swift identification and intervention are vital to prevent the disease from progressing to more advanced stages and causing severe damage to the plants.",
    description2:
        "A treatment plan for blight leaf disease at stage 1 is essential to prevent the disease from spreading and causing severe damage to your plants. Here's a plan to manage blight leaf disease effectively in its early stages",
    treatmentPlan: {
      0: TreatmentPlan(
        plan: "Prune and Remove Affected Leaves",
        desc:
            "Begin by carefully pruning and removing leaves showing early blight symptoms. Dispose of the infected plant material properly, as it can harbor the pathogen.",
      ),
      1: TreatmentPlan(
        plan: "Sanitation",
        desc:
            "Maintain good garden hygiene by regularly cleaning up fallen leaves and plant debris, which can harbor the blight pathogen.",
      ),
      2: TreatmentPlan(
        plan: "Fungicide Application",
        desc:
            "Consider applying a preventive fungicide treatment labeled for blight control. Consult with local agricultural extension services or experts for recommendations on the most suitable fungicide and application timing for your region and plant type.",
      ),
      3: TreatmentPlan(
        plan: "Water Management",
        desc:
            "Water your plants at the base rather than overhead to minimize leaf wetness, which can encourage blight development. Water early in the day to allow foliage to dry before evening.",
      ),
      4: TreatmentPlan(
        plan: "Mulch and Weed Control: ",
        desc:
            "Apply mulch around the base of plants to prevent soil splashing onto the leaves, as the pathogen can be soil-borne. Keep the garden area weed-free to reduce the risk of blight spores harboring in nearby plants.",
      ),
      5: TreatmentPlan(
        plan: "Monitor and Scout",
        desc:
            "Regularly inspect your plants for any signs of new infections. Early detection is key to prompt action.",
      ),
      6: TreatmentPlan(
        plan: "Record Keeping",
        desc:
            "Maintain records of disease incidence, treatment schedules, and their effectiveness for future reference.",
      ),
      7: TreatmentPlan(
        plan: "Crop Rotation",
        desc:
            "If possible, practice crop rotation in subsequent seasons to reduce the risk of blight recurrence in the same area.",
      ),
      8: TreatmentPlan(
        plan: "Consult Experts",
        desc:
            "Seek advice from local horticultural experts or agricultural extension services for guidance specific to your region and plant variety.",
      ),
    },
  ),
  DiseaseModel(
    key: "Blight_leaf_disease_stage 2",
    disease: "Blight leaf disease stage 2",
    description:
        "In the second stage of blight leaf disease, the situation intensifies with more noticeable and destructive symptoms. Infected plant leaves display larger, dark lesions with characteristic concentric rings, often surrounded by a yellow halo. These lesions can rapidly multiply, causing the leaves to wither and die, significantly impacting the plant's overall health and vitality. At this stage, the disease may spread to the plant's fruit or tubers, posing a severe threat to crop yields. Timely intervention and a comprehensive management strategy are imperative to prevent further escalation and mitigate the damage caused by blight leaf disease",
    description2: "",
    treatmentPlan: {
      0: TreatmentPlan(
        plan: "Prune and Remove Affected Plant Parts",
        desc:
            "Continue to prune and remove severely infected leaves, stems, or fruit. Dispose of the infected material away from your garden, and do not compost it.",
      ),
      1: TreatmentPlan(
        plan: "Sanitation",
        desc:
            "Maintain excellent garden hygiene by cleaning up fallen leaves and plant debris regularly to prevent overwintering of the pathogen.",
      ),
      2: TreatmentPlan(
        plan: "Fungicide Application",
        desc:
            "Apply a broad-spectrum fungicide labeled for blight control, following the recommended schedule and dosage. Consult with local experts for specific recommendations based on your region and plant type.",
      ),
      3: TreatmentPlan(
        plan: "Isolate and Quarantine",
        desc:
            "Isolate severely infected plants from healthy ones to prevent the spread of the disease. Consider removing the most heavily affected plants.",
      ),
      4: TreatmentPlan(
        plan: "Water Management",
        desc:
            "Continue to water at the base of plants to minimize leaf wetness. Remove any irrigation methods that spray water onto leaves.",
      ),
      5: TreatmentPlan(
        plan: "Mulch and Weed Control",
        desc:
            "Maintain mulch and weed control to reduce soil splashing, which can transfer blight spores onto leaves.",
      ),
      6: TreatmentPlan(
        plan: "Harvest Early",
        desc:
            "Harvest mature fruit or tubers as soon as possible to salvage what you can before they become severely affected.",
      ),
      7: TreatmentPlan(
        plan: "Crop Rotation",
        desc:
            "Practice crop rotation in the next growing season to reduce the risk of blight recurrence in the same area.",
      ),
      8: TreatmentPlan(
        plan: "Monitor and Scout",
        desc:
            "Regularly inspect your plants for new infections, and remove affected parts promptly.",
      ),
      9: TreatmentPlan(
        plan: "Record Keeping",
        desc:
            "Maintain records of disease management efforts, including fungicide applications and their effectiveness.",
      ),
      10: TreatmentPlan(
        plan: "Consult with Experts",
        desc:
            "Seek guidance from local horticultural experts or agricultural extension services for advice tailored to your region and plant variety.",
      ),
    },
  ),
];
