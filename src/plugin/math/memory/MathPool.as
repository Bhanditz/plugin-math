package plugin.math.memory {
	import plugin.core.pool.Pool;
	import plugin.math.algebra.APoint;
	import plugin.math.algebra.AVector;
	import plugin.math.algebra.AxisAngle;
	import plugin.math.algebra.HMatrix;
	import plugin.math.algebra.HPlane;
	import plugin.math.algebra.HPoint;
	import plugin.math.algebra.HQuaternion;
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class MathPool
	{
		public static const APOINT:Pool 		= new Pool(APoint, 		[], 				100, 20, 500);
		public static const AVECTOR:Pool 		= new Pool(AVector, 	[],					100, 20, 500);
		public static const AXISANGLE:Pool  	= new Pool(AxisAngle, 	[new AVector()],	 50, 10, 500); // TODO We are ironically newing up an object here, can we preserve the API but stop new?
		public static const HMATRIX:Pool  		= new Pool(HMatrix, 	[],					200, 20, 500);
		public static const HPLANE:Pool 		= new Pool(HPlane, 		[new AVector()],	 30, 10, 500);
		public static const HPOINT:Pool 		= new Pool(HPoint, 		[],					200, 20, 500);
		public static const HQUATERNION:Pool	= new Pool(HQuaternion, [],					200, 20, 500);
		
		// helpers
		public static function getAPoint(x:Number = 0, y:Number = 0, z:Number = 0):APoint
		{
			var p:APoint = APOINT.pop();
			p.set( x, y, z );
			return p;
		}
		
		public static function returnAPoint( o:APoint ):void
		{
			return APOINT.push(o);
		}
		
		public static function getAVector(x:Number = 0, y:Number = 0, z:Number = 0):AVector
		{
			var v:AVector = AVECTOR.pop() as AVector;
			v.set(x, y, z);
			return v;
		}
		
		public static function returnAVector( o:AVector ):void
		{
			return AVECTOR.push(o);
		}
		
		public static function getAxisAngle(x:Number = 0, y:Number = 0, z:Number = 0, angle:Number = 0):AxisAngle
		{
			var a:AxisAngle = AXISANGLE.pop();
			a.axis.set( x, y, z );
			a.angle = angle;
			return AXISANGLE.pop();
		}
		
		public static function returnAxisAngle( o:AVector ):void
		{
			return AXISANGLE.push(o);
		}
		
		public static function getHMatrix():HMatrix
		{
			return HMATRIX.pop();
		}
		
		public static function returnHMatrix( o:HMatrix ):void
		{
			return HMATRIX.push(o);
		}
		
		public static function getHPlane(x:Number = 0, y:Number = 0, z:Number = 0, constant:Number = 0):HPlane
		{
			var p:HPlane = HPLANE.pop();
			p.normal.set(x, y, z);
			p.constant = constant;
			return HPLANE.pop();
		}
		
		public static function returnHPlane( o:HPlane ):void
		{
			return HPLANE.push(o);
		}
		
		public static function getHPoint( x:Number = 0, y:Number = 0, z:Number = 0, w:Number = 0):HPoint
		{
			var p:HPoint = HPOINT.pop();
			p.set( x, y, z, w );
			return p;
		}
		
		public static function returnHPoint( o:HPoint ):void
		{
			return HPOINT.push(o);
		}
		
		public static function getHQuaternion( w:Number, x:Number = 0, y:Number = 0, z:Number = 0 ):HQuaternion
		{
			var q:HQuaternion = HQUATERNION.pop();
			q.set( w, x, y, z );
			return q;
		}
		
		public static function returnHQuaternion( o:HQuaternion ):void
		{
			return HQUATERNION.push(o);
		}
		
	}

}