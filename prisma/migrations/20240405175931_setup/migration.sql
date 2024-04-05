/*
  Warnings:

  - You are about to drop the column `count` on the `Rating` table. All the data in the column will be lost.
  - You are about to drop the column `rate` on the `Rating` table. All the data in the column will be lost.
  - Made the column `ratingId` on table `Product` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `productId` to the `Rating` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rating` to the `Rating` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_ratingId_fkey";

-- AlterTable
ALTER TABLE "Product" ALTER COLUMN "ratingId" SET NOT NULL;

-- AlterTable
ALTER TABLE "Rating" DROP COLUMN "count",
DROP COLUMN "rate",
ADD COLUMN     "productId" TEXT NOT NULL,
ADD COLUMN     "rating" DOUBLE PRECISION NOT NULL;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_ratingId_fkey" FOREIGN KEY ("ratingId") REFERENCES "Rating"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
